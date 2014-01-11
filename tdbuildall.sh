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

echo "${bldred}Remove Old Hellkat Versions Before Compile${txtrst}"
rm -f out/target/product/*/Hellkat*.zip

echo ""
echo "${bldred}It's time to build some HellKat ROMs!!!${txtrst}"
sleep 5

echo ""
echo "${bldred}Compiling Hercules!!!${txtrst}"
sleep 5
bash hkbuild.sh mako

echo ""
echo "${bldred}Compiling Hercules!!!${txtrst}"
sleep 5
bash hkbuild.sh hercules

echo ""
echo "${bldred}Compiling Skyrocket!!!${txtrst}"
sleep 5
bash hkbuild.sh skyrocket

echo ""
echo "${bldred}Compiling t0lte!!!${txtrst}"
sleep 5
bash hkbuild.sh t0lte

echo ""
echo "${bldred}Compiling n7100!!!${txtrst}"
sleep 5
bash hkbuild.sh n7100

echo ""
echo "${bldred}Compiling jfltetmo!!!${txtrst}"
sleep 5
bash hkbuild.sh jfltetmo
           

