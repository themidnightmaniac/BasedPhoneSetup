#!/bin/sh

MAGISK_SRC=$(curl -s "https://api.github.com/repos/topjohnwu/Magisk/releases/latest" \
	| grep browser_download_url \
	| grep 'Magisk-.*.apk' \
	| cut -d '"' -f 4)
LSPOSED_SRC=$(curl -s "https://api.github.com/repos/LSPosed/LSPosed/releases/latest" \
	| grep browser_download_url \
	| grep 'LSPosed-.*-zygisk-release.zip' \
	| cut -d '"' -f 4)
MICROG_SRC=$(curl -s "https://api.github.com/repos/FriendlyNeighborhoodShane/MinMicroG_releases/releases/latest" \
	| grep browser_download_url \
	| grep 'MinMicroG-Minimal-.*.zip' \
	| cut -d '"' -f 4)
WAPP_SRC='http://www.whatsapp.com/android/current/WhatsApp.apk'
TT9_SRC=$(curl -s "https://api.github.com/repos/sspanak/tt9/releases/latest" \
	| grep browser_download_url \
	| grep 'tt9-.*-full.apk' \
	| cut -d '"' -f 4)
CAM_SRC=$(curl -s "https://api.github.com/repos/GrapheneOS/Camera/releases/latest" \
	| grep browser_download_url \
	| grep 'Camera-.*.apk' \
	| cut -d '"' -f 4)
FAKEGAPPS_SRC=$(curl -s "https://api.github.com/repos/whew-inc/FakeGApps/releases/latest" \
	| grep browser_download_url \
	| grep 'app-release.apk' \
	| cut -d '"' -f 4)
SATSTAT_SRC=$(curl -s "https://f-droid.org/packages/com.vonglasow.michael.satstat/" \
	| grep -o 'https://f-droid.org/repo/com.vonglasow.michael.satstat_.*.apk' \
	| head -1)
DEBLOATER_SRC=$(curl -s "https://api.github.com/repos/sunilpaulmathew/De-Bloater/releases/latest" \
	| grep browser_download_url \
	| grep 'app-release.apk' \
	| cut -d '"' -f 4)
#AGPS_SRC=$
USER_AGENT='--user-agent=Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:21.0) Gecko/20100101 Firefox/21.0'
download_file(){
	echo "Downloading $1..."
	if [[ $1 == $CAM_SRC || $1 == $WAPP_SRC || $1 == $TT9_SRC || $1 == $SATSTAT_SRC ]]; then
		dload_path='./Apps/Misc/'
	elif [[ $1 == $MAGISK_SRC || $1 == $FAKEGAPPS_SRC || $1 == $DEBLOATER_SRC ]]; then
		dload_path='./Apps/QOL/'
	elif [[ $1 == $MICROG_SRC || $1 == $LSPOSED_SRC || $1 == $AGPS_SRC]]; then
		dload_path='./Apps/Modules/'
	else
	fi
	wget -q "$USER_AGENT" $1
}
