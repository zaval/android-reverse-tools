#!/bin/bash

if [ -z "$1" ]
then
	echo USAGE: $0 package-name
	exit 0
fi

csrf=`curl --cookie-jar /tmp/cookies.txt https://apkpure.com/region-free-apk-download --silent | sed -n 's/.*name="_csrf" value="\([^"]\+\).*/\1/p'`

if [ -z "$csrf" ]
then
	echo Can not parse csrf
	exit 0
fi

csrf=${csrf//\n//}

download_url=`curl --cookie /tmp/cookies.txt -D /tmp/headers.txt -H x-requested-with:XMLHttpRequest -d package=$1 -d region=US -d _csrf=$csrf -e https://apkpure.com/region-free-apk-download --silent https://apkpure.com/api/www/cmd-down | sed -n 's/.*down_url":"\([^"]\+\)".*/\1/p'`

if [ -z "$download_url" ]
then
	echo Can not parse download url
	exit 0
fi

curl --cookie /tmp/cookies.txt -D /tmp/headers.txt -o $1.apk $download_url
rm -f /tmp/headers.txt