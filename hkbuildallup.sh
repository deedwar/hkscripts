#!/bin/bash

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

# Start Time
res1=$(date +%s.%N)

echo "${bldred}Remove Old Hellkat Versions Before Compile${txtrst}"
rm -f out/target/product/*/Hellkat*.zip

echo ""
echo "${bldred}It's time to build some HellKat ROMs!!!${txtrst}"
sleep 5

echo ""
echo "${bldred}Compiling Mako!!!${txtrst}"
sleep 5
bash hkbuild.sh mako
scp -v out/target/product/mako/Hellkat*.zip helldevs@upload.goo.im:/home/helldevs/public_html/mako/hellkat/

echo ""
echo "${bldred}Compiling Hammerhead!!!${txtrst}"
sleep 5
bash hkbuild.sh hammerhead
scp -v out/target/product/hammerhead/Hellkat*.zip helldevs@upload.goo.im:/home/helldevs/public_html/hammerhead/hellkat/

echo ""
echo "${bldred}Compiling Hercules!!!${txtrst}"
sleep 5
bash hkbuild.sh hercules
scp -v out/target/product/hercules/Hellkat*.zip helldevs@upload.goo.im:/home/helldevs/public_html/hercules/hellkat/

echo ""
echo "${bldred}Compiling Skyrocket!!!${txtrst}"
sleep 5
bash hkbuild.sh skyrocket
scp -v out/target/product/skyrocket/Hellkat*.zip helldevs@upload.goo.im:/home/helldevs/public_html/skyrocket/hellkat/

echo ""
echo "${bldred}Compiling t0lte!!!${txtrst}"
sleep 5
bash hkbuild.sh t0lte
scp -v out/target/product/t0lte/Hellkat*.zip helldevs@upload.goo.im:/home/helldevs/public_html/t0lte/hellkat/

echo ""
echo "${bldred}Compiling n7100!!!${txtrst}"
sleep 5
bash hkbuild.sh n7100
scp -v out/target/product/n7100/Hellkat*.zip helldevs@upload.goo.im:/home/helldevs/public_html/n7100/hellkat/

echo ""
echo "${bldred}Compiling jfltetmo!!!${txtrst}"
sleep 5
bash hkbuild.sh jfltetmo
scp -v out/target/product/jfltetmo/Hellkat*.zip helldevs@upload.goo.im:/home/helldevs/public_html/jfltetmo/hellkat/
           

echo ""
echo "${bldred}Compiling otter!!!${txtrst}"
sleep 5
bash hkbuild.sh otter
scp -v out/target/product/otter/Hellkat*.zip helldevs@upload.goo.im:/home/helldevs/public_html/otter/hellkat/


# Show Elapsed Time
res2=$(date +%s.%N)
echo "${bldred}Total elapsed time of ALL BUILDS AND UPLOADS: ${txtrst}${red}$(echo "($res2 - $res1) / 60"|bc ) minutes ($(echo "$res2 - $res1"|bc ) seconds) ${txtrst}"

