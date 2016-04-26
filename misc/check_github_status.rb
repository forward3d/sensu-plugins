#! /opt/sensu/embedded/bin/ruby
#
#   check_github_status.rb
#
# DESCRIPTION:
#   Interacts with Github Status API to check the system status of Github.com itself.
#
# OUTPUT:
#
# PLATFORMS:
#   All
#
# DEPENDENCIES:
#   gem: sensu-plugin
#   gem: net/http
#   gem: json
#   gem: sensu-plugin
#
# USAGE:
#   ./check_github_status.rb
#
# NOTES:
#
#
# LICENSE:
#   
#   Released under the same terms as Sensu (the MIT license); see LICENSE
#   for details.
#

require 'json'
require 'net/http'
require 'openssl'
require 'sensu-plugin/check/cli'

# Check the status of Github via their Status JSON API

class CheckSystemStatus < Sensu::Plugin::Check::CLI
    
  def run
    # This endpoint has the last message + status
    api_endpoint = "https://status.github.com/api/last-message.json"

    # Get JSON from endpoint
    uri = URI.parse(api_endpoint)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    status_json = JSON.parse http.get(uri.request_uri).body

  
    # Keys are status, body, created_on
    case status_json["status"]
      when "good"
        ok "GitHub status is 'good', message: '#{status_json["body"]}', at: #{status_json["created_on"]}"
      when "minor"
        warning "GitHub status is 'minor', message: '#{status_json["body"]}', at: #{status_json["created_on"]}"
      when "major"
        critical "GitHub status is 'major', message: '#{status_json["body"]}', at: #{status_json["created_on"]}"
    end
  end
end
