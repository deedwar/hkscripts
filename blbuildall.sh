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

echo "${bldred}Remove Old BlueLightning Versions Before Compile${txtrst}"
rm -f out/target/product/*/BlueLightning*.zip

echo ""
echo "${bldblu}It's time to build some BlueLightning ROMs!!!${txtrst}"
sleep 5

echo ""
echo "${bldblu}Compiling Mako!!!${txtrst}"
sleep 5
bash blbuild.sh mako

echo ""
echo "${bldblu}Compiling Hercules!!!${txtrst}"
sleep 5
bash blbuild.sh hercules

echo ""
echo "${bldblu}Compiling Skyrocket!!!${txtrst}"
sleep 5
bash blbuild.sh skyrocket

echo ""
echo "${bldblu}Compiling t0lte!!!${txtrst}"
sleep 5
bash blbuild.sh t0lte

echo ""
echo "${bldblu}Compiling n7100!!!${txtrst}"
sleep 5
bash blbuild.sh n7100

echo ""
echo "${bldblu}Compiling jfltetmo!!!${txtrst}"
sleep 5
bash blbuild.sh jfltetmo
           

