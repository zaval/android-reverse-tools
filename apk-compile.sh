#!/bin/bash

echo `pwd`

if [ ! -f ./classes-dex2jar.jar ]
then
	echo This is not folder with apk source
	exit 0
fi
d2j-jar2dex.sh -o classes.dex -f classes-dex2jar.jar || exit 1
rm -rf dist

package=${PWD##*/}

cd ..
apktool b $package $package.apk || exit 1
d2j-apk-sign.sh -o $package/dist/$package-signed.apk $package/dist/$package.apk