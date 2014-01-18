#!/bin/bash
# BlueLightning Build Script 1.0  

# Fetch Current Path
reldir=`dirname $0`
cd $reldir
DIR=`pwd`

# Colorize Scripts
red=$(tput setaf 1) # red
grn=$(tput setaf 2) # green
cya=$(tput setaf 6) # cyan
pnk=$(tput bold ; tput setaf 5) # pink
yel=$(tput bold ; tput setaf 3) # yellow
pur=$(tput setaf 5) # purple
txtbld=$(tput bold) # Bold
bldred=${txtbld}$(tput setaf 1) # red
bldgrn=${txtbld}$(tput setaf 2) # green
bldyel=${txtbld}$(tput bold ; tput setaf 3) # yellow
bldblu=${txtbld}$(tput setaf 4) # blue
bldpur=${txtbld}$(tput setaf 5) # purple
bldpnk=${txtbld}$(tput bold ; tput setaf 5) # pink
bldcya=${txtbld}$(tput setaf 6) # cyan
txtrst=$(tput sgr0) # Reset
DEVICE="$1"
EXTRAS="$2"

# Start Time
res1=$(date +%s.%N)

# Clear Scrollback Buffer
echo -e '\0033\0143'
clear

# BlueLightning Logo
echo -e ${bldcya}"                                                   "${txtrst}
echo -e ${bldcya}"                                                   "${txtrst}
echo -e ${bldcya}"                 (   (                             "${txtrst}
echo -e ${bldcya}"               ( )\  )\   (     (                  "${txtrst}
echo -e ${bldcya}"               )((_)((_) ))\   ))\                 "${txtrst}
echo -e ${bldcya}"             ((_)_  _  /((_) /((_)                 "${txtrst}
echo -e ${bldcya}"               | _ )| |(_))( (_))                  "${txtrst}
echo -e ${bldcya}"               | _ \| || || |/ -_)                 "${txtrst}
echo -e ${bldcya}"               |___/|_| \_,_|\___|                 "${txtrst}
echo -e ${bldcya}" (                                                 "${txtrst}
echo -e ${bldcya}" )\ )               )     )                        "${txtrst}
echo -e ${bldcya}"(()/( (   (  (   ( /(  ( /(       (          (  (  "${txtrst}
echo -e ${bldcya}" /(_)))\  )\))(  )\()) )\()) (    )\   (     )\))( "${txtrst}
echo -e ${bldcya}"(_)) ((_)((_))\ ((_)\ (_))/  )\ )((_)  )\ ) ((_))\ "${txtrst}
echo -e ${bldcya}"| |   (_) (()(_)| |(_)| |_  _(_/( (_) _(_/(  (()(_)"${txtrst}
echo -e ${bldcya}"| |__ | |/ _  | | ' \ |  _|| ' \))| || ' \))/ _  | "${txtrst}
echo -e ${bldcya}"|____||_|\__, | |_||_| \__||_||_| |_||_||_| \__, | "${txtrst}
echo -e ${bldcya}"         |___/                              |___/  "${txtrst}
echo -e ${bldcya}"                                                   "${txtrst}
echo -e ${bldcya}"                                                   "${txtrst}
echo -e ${bldcya}"                                                   "${txtrst}

# Prebuilt Files
echo -e ""
echo -e "${bldcya}Downloading Prebuilts from CM${txtrst}"
cd vendor/cm
./get-prebuilts
cd ./../..
echo -e ""

# Make it so EVERY kernel fingerprint is #1
rm -f out/target/product/*/obj/KERNEL_OBJ/.version

# Setup Environment
echo -e "${bldyel}Setting Up Environment ${txtrst}"
. build/envsetup.sh

# Lunch Device
echo -e ""
echo -e "${bldpnk}Lunching device ${txtrst}"
lunch "cm_$DEVICE-userdebug";

echo -e ""
echo -e "${bldblu}Compiling BlueLightning!!! ${txtrst}"

# Cleanup Out Directory
rm -f out/target/product/$DEVICE/system/build.prop
rm -rf out/target/product/$DEVICE/*.zip
rm -rf out/target/product/$DEVICE/*.zip.md5sum

# Start Compilation
script -q ~/BLCompile.log -c " make bacon -j12 "
echo -e ""

# Show Elapsed Time
res2=$(date +%s.%N)
echo "${bldred}Total time elapsed: ${txtrst}${red}$(echo "($res2 - $res1) / 60"|bc ) minutes ($(echo "$res2 - $res1"|bc ) seconds) ${txtrst}"
