#
# Bash Shell Script to download a non-latest version of the Mac tgz release for Splunk enterprise.
#

latest=$(curl 'https://www.splunk.com/en_us/download/sem.html' | grep darwin | perl -lne '/splunk\-\d\.\d\.\d(\.\d\-|\-)\w+\-darwin\-64\.tgz/ && print $&')
echo
echo
echo "The latest Mac release:"
echo
echo $latest
echo

echo "Please enter a non-latest version release to download. Example: 7.3.4"
echo
read version

filename=$(curl 'https://www.splunk.com/en_us/download/previous-releases.html' | grep darwin | perl -lne '/splunk\-'$version'\-\w+\-darwin\-64\.tgz/ && print $&')
echo
echo "Downloading $filename"
echo

wget -O $filename 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86&platform=macos&version='$version'&product=splunk&filename='$filename'&wget=true' -q --show-progress
