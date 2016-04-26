# Misc Plugins

* [Misc Plugins](#misc-plugins)
  * [check\_statuspageio\_status\.rb](#check_statuspageio_statusrb)
    * [Usage](#usage)
    * [Notes](#notes)
  * [check\_github\_status\.rb](#check_github_statusrb)
    * [Usage](#usage-1)
    * [Notes](#notes-1)


## check_statuspageio_status.rb

This plugins allows you to check the status of whichever StatusPage.io endpoint you wish to monitor, e.g. [Atlassian BitBucket](https://bqlf8qjztdtr.statuspage.io/api/v2/summary.json).

StatusPage.io has three states:

`none` This means all is operational, this translates to **OK**

`minor` There is slight service degradation, this translates to **WARNING**

`major` There are critical issues with the service, this translates to **CRITICAL**

The check will return the description of the service's current state. If the status of the service is minor or major, it will return the incident's description as well.


### Usage

	check_statuspageio_check.rb -e http://bqlf8qjztdtr.statuspage.io/api/v2/summary.json

Arguments are as follows:
* `-e` specify the StatusPage.io endpoint


### Notes

Due to the check being agnostic, you'll need to specify the StatusPage.io api endpoint as shown above.



## check_github_status.rb

This plugin checks the current status of GitHub using their [Status API](https://status.github.com/api).

GitHub status has three different states:

`good` This means all is operational, this translates to **OK**

`minor` There is slight service degradation, this translates to **WARNING**

`major` There are critical issues with the service, this translates to **CRITICAL**

The check will return the body of the status message so you can see what the reason is for the service degradation.


### Usage 

	check_github_status.rb


### Notes

You do not need to specify any arguments, as it's uses as a fixed [endpoint](https://status.github.com/api/last-message.json).