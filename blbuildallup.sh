#!/bin/bash
# BlueLightning Build All and Upload Script.  Made by Cl3Kener.

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

echo "${bldblu}Remove Old BlueLightning Versions Before Compile${txtrst}"
rm -f out/target/product/*/BlueLightning*.zip

echo ""
echo "${bldblu}It's time to build some BlueLightning ROMs!!!${txtrst}"
sleep 5

echo ""
echo "${bldblu}Compiling Mako!!!${txtrst}"
sleep 5
bash blbuild.sh mako
sshpass -e scp -v -P 2222 out/target/product/mako/BlueLightning*.zip helldevs@upload.goo.im:/home/helldevs/public_html/mako/bluelightning/

echo ""
echo "${bldblu}Compiling Hammerhead!!!${txtrst}"
sleep 5
bash blbuild.sh hammerhead
sshpass -e scp -v -P 2222 out/target/product/hammerhead/BlueLightning*.zip helldevs@upload.goo.im:/home/helldevs/public_html/hammerhead/bluelightning/

echo ""
echo "${bldblu}Compiling Hercules!!!${txtrst}"
sleep 5
bash blbuild.sh hercules
sshpass -e scp -v -P 2222 out/target/product/hercules/BlueLightning*.zip helldevs@upload.goo.im:/home/helldevs/public_html/hercules/bluelightning/

echo ""
echo "${bldblu}Compiling Skyrocket!!!${txtrst}"
sleep 5
bash blbuild.sh skyrocket
sshpass -e scp -v -P 2222 out/target/product/skyrocket/BlueLightning*.zip helldevs@upload.goo.im:/home/helldevs/public_html/skyrocket/bluelightning/

echo ""
echo "${bldblu}Compiling t0lte!!!${txtrst}"
sleep 5
bash blbuild.sh t0lte
sshpass -e scp -v -P 2222 out/target/product/t0lte/BlueLightning*.zip helldevs@upload.goo.im:/home/helldevs/public_html/t0lte/bluelightning/

echo ""
echo "${bldblu}Compiling n7100!!!${txtrst}"
sleep 5
bash blbuild.sh n7100
sshpass -e scp -v -P 2222 out/target/product/n7100/BlueLightning*.zip helldevs@upload.goo.im:/home/helldevs/public_html/n7100/bluelightning/

echo ""
echo "${bldblu}Compiling jfltetmo!!!${txtrst}"
sleep 5
bash blbuild.sh jfltetmo
sshpass -e scp -v -P 2222 out/target/product/jfltetmo/BlueLightning*.zip helldevs@upload.goo.im:/home/helldevs/public_html/jfltetmo/bluelightning/

# Show Elapsed Time
res2=$(date +%s.%N)
echo "${bldblu}Total elapsed time of ALL BUILDS AND UPLOADS: ${txtrst}${blu}$(echo "($res2 - $res1) / 60"|bc ) minutes ($(echo "$res2 - $res1"|bc ) seconds) ${txtrst}"

