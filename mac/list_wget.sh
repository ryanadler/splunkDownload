#
# Bash Shell Script to display the different wget statements.
#

html=$(curl 'https://www.splunk.com/en_us/download/sem.html' -s)


##### 
# Linux installations
#####

nixTGZ=$(echo $html | grep Linux-x86_64 | perl -lne '/splunk\-\d\.\d\.\d(\.\d\-|\-)\w+\-Linux\-x86_64\.tgz/ && print $&')
nixTGZfw=$(echo $nixTGZ | sed 's/splunk/splunkforwarder/g')
nixRPM=$(echo $html | grep rpm | perl -lne '/splunk\-\d\.\d\.\d(\.\d\-|\-)\w+\-linux\-\d\.\d\-x86_64\.rpm/ && print $&')
nixRPMfw=$(echo $nixRPM | sed 's/splunk/splunkforwarder/g')
nixDEB=$(echo $html | grep deb | perl -lne '/splunk\-\d\.\d\.\d(\.\d\-|\-)\w+\-linux\-\d\.\d\-amd64\.deb/ && print $&')
nixDEBfw=$(echo $nixDEB | sed 's/splunk/splunkforwarder/g')

#####
# Mac installations
#####

macTGZ=$(echo $html | grep darwin | perl -lne '/splunk\-\d\.\d\.\d(\.\d\-|\-)\w+\-darwin\-64\.tgz/ && print $&')
macDMG=$(echo $html | grep macosx | perl -lne '/splunk\-\d\.\d\.\d(\.\d\-|\-)\w+\-macosx\-\d+\.\d+\-intel\.dmg/ && print $&')

#####
# Windows insatllations
#####

winMSI=$(echo $html | grep release.msi | perl -lne '/splunk\-\d\.\d\.\d(\.\d\-|\-)\w+\-x64\-release\.msi/ && print $&')
winMSIfw=$(echo $winMSI | sed 's/splunk/splunkforwarder/g')

#####
# Variables
#####

version=$(echo $nixTGZ | sed 's/splunk-//g' | sed 's/-.*//g')

echo
echo "#####"
echo "# Linux Files:"
echo "#####"
echo
echo $nixTGZ
echo $nixTGZfw
echo
echo $nixRPM
echo $nixRPMfw
echo
echo $nixDEB
echo $nixDEBfw
echo
echo "#####"
echo "# Windows Files:"
echo "#####"
echo 
echo $winMSI
echo $winMSIfw
echo
echo "#####"
echo "# Mac Files:"
echo "#####"
echo
echo $macTGZ
echo $macDMG
echo
#echo "#### Linux WGET Statements ####"
#echo wget -O $nixFilename '"https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=linux&version='$version'&product=splunk&filename='$nixFilename'&wget=true"' -q --show-progress
#echo
#echo wget -O $nixFW '"https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=linux&version='$version'&product=universalforwarder&filename='$nixFW'&wget=true"' -q --show-progress
#echo
#echo
#echo "#### Mac WGET Statement ####" 
#echo wget -O $macFilename '"https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86&platform=macos&version='$version'&product=splunk&filename='$macFilename'&wget=true"' -q --show-progress
#echo
#echo
#echo "#### Windows WGET Statements ####"
#echo wget -O $winFilename '"https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=windows&version='$version'&product=splunk&filename='$winFilename'&wget=true"'
#echo
#echo wget -O $winFW '"https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=windows&version='$version'&product=universalforwarder&filename='$winFW'&wget=true"'
