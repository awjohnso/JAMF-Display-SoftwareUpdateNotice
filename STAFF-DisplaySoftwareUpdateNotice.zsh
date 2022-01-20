#!/bin/zsh

# Author: Andrew W. Johnson
# Date: 2020.05.19.
# Version 1.00
# Organization: Stony Brook University/DoIT
#
#
# This script utilizes the jamfHelper tool to display a warning message to
# the end user that after work on the day this script is scheduled to run,
# the computer will try to apply software updates.
#
# The user is instructed to save their work and close all programs and reboot
# the computer and not to log in.

	# Setup some variables.
jamfHelper="/Library/Application Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper"
icon="/System/Library/CoreServices/Install Command Line Developer Tools.app/Contents/Resources/SoftwareUpdate.icns"
title="Software Update"
heading="**ALERT**"
description=$(echo -e "Your computer has multiple pending updates! These must be applied tonight so please save your work and close all programs at the end of the day! Reboot your computer at the end of the workday and leave it at the login screen.  You do not need to login.  We will apply the pending updates overnight.\n\nAny questions or concerns, contact:\n\nCustomer Engagement & Support at:\n631-632-9800\nhttps://service.stonybrook.edu")

	# Check to see if the finder is up.
myFinder=$( /bin/ps -ax | /usr/bin/egrep -i Finder | /usr/bin/egrep -ivc egrep )
if [ ${myFinder} -gt 0 ]; then
	${jamfHelper} -windowType utility -title "${title}" -heading "${heading}" -alignHeading center -description "${description}" -alignDescription natural -button1 "Okay" -icon ${icon} -timeout 7200 -defaultButton 1
fi

exit 0