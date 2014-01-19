#!/bin/bash
# CM11 Build All and Upload Script.  Made by Cl3Kener.

# Colorize and add text parameters
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

export SSHPASS=XXXXXXXX

# Start Time
res1=$(date +%s.%N)

echo "${bldcya}Remove Old CM11 Versions Before Compile${txtrst}"
rm -f out/target/product/*/cm-11*.zip

echo ""
echo "${bldcya}It's time to build some CM11 ROMs!!!${txtrst}"
sleep 5

echo ""
echo "${bldcya}Compiling Mako!!!${txtrst}"
sleep 5
bash cmbuild.sh mako
sshpass -e scp -v -P 2222 out/target/product/mako/cm-11*.zip helldevs@upload.goo.im:/home/helldevs/public_html/mako/cm11/

echo ""
echo "${bldcya}Compiling Hammerhead!!!${txtrst}"
sleep 5
bash cmbuild.sh hammerhead
sshpass -e scp -v -P 2222 out/target/product/hammerhead/cm-11*.ziphelldevs@upload.goo.im:/home/helldevs/public_html/hammerhead/cm11/

echo ""
echo "${bldcya}Compiling Hercules!!!${txtrst}"
sleep 5
bash cmbuild.sh hercules
sshpass -e scp -v -P 2222 out/target/product/hercules/cm-11*.zip helldevs@upload.goo.im:/home/helldevs/public_html/hercules/cm11/

echo ""
echo "${bldcya}Compiling Skyrocket!!!${txtrst}"
sleep 5
bash cmbuild.sh skyrocket
sshpass -e scp -v -P 2222 out/target/product/skyrocket/cm-11*.zip helldevs@upload.goo.im:/home/helldevs/public_html/skyrocket/cm11/

echo ""
echo "${bldcya}Compiling t0lte!!!${txtrst}"
sleep 5
bash cmbuild.sh t0lte
sshpass -e scp -v -P 2222 out/target/product/t0lte/cm-11*.zip helldevs@upload.goo.im:/home/helldevs/public_html/t0lte/cm11/

echo ""
echo "${bldcya}Compiling n7100!!!${txtrst}"
sleep 5
bash cmbuild.sh n7100
sshpass -e scp -v -P 2222 out/target/product/n7100/cm-11*.zip helldevs@upload.goo.im:/home/helldevs/public_html/n7100/cm11/

echo ""
echo "${bldcya}Compiling jfltetmo!!!${txtrst}"
sleep 5
bash cmbuild.sh jfltetmo
sshpass -e scp -v -P 2222 out/target/product/jfltetmo/cm-11*.zip helldevs@upload.goo.im:/home/helldevs/public_html/jfltetmo/cm11/

# Show Elapsed Time
res2=$(date +%s.%N)
echo "${bldcya}Total elapsed time of ALL BUILDS AND UPLOADS: ${txtrst}${cya}$(echo "($res2 - $res1) / 60"|bc ) minutes ($(echo "$res2 - $res1"|bc ) seconds) ${txtrst}"

