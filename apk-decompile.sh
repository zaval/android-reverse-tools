#!/bin/bash

if [ -z "$1" ]
then
	echo USAGE: $0 apk-file
	exit 0
fi

apktool d -s -r $1

cd ${1%.apk}

d2j-dex2jar.sh classes.dex
java -jar $REVERSEPATH/jd-core.jar classes-dex2jar.jar src
cd -
