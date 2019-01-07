#!/bin/bash

#This a load script for common tools used to set up security testing infrastructure.  Less time consuming than PTF-update all.
#Future plan is to customize PTF for tools I use.


# variables
BLUE='\033[1;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

apt-get update ; apt-get -y upgrade ; apt-get -y dist-upgrade ; apt-get -y autoremove ; apt-get -y autoclean ; echo

#Google Rapid Response
if [ -d /opt/grr ]; then
    echo -e "${BLUE}Updating GRR.${NC}"
    cd /opt/grr/ ; git pull
    echo
else 
    echo -e "${YELLOW}Installing GRR.${NC}"
    git clone https://github.com/google/grr /opt/grr
    echo
fi

#Red Team Field Manual
if [ -d /opt/rtfm ]; then
    echo -e "${BLUE}Updating Red Team Field Manual.${NC}"
    cd /opt/rtfm/ ; /opt/rtfm/rtfm.py -u;
else
    echo -e "${YELLOW}Installing Red Team Field Manual.${NC}"
    git clone https://github.com/leostat/rtfm.git /opt/rtfm/;  chmod +x /opt/rtfm/rtfm.py; /opt/rtfm/rtfm.py -u;
    echo
fi

#Sandbox NMAP Framework
if [ -d /opt/sandbox ]; then
    echo -e "${BLUE}Updating Sandbox NMAP framework.${NC}"
#    cd /opt/sandbox/ ' /opt/sandbox
else 
    echo -e "${YELLOW}Installing Sandbox NMAP Framework.${NC}"
    git clone --recursive https://github.com/trimstray/sandmap  /opt/sandbox/;  chmod +x /opt/sandbox/setup.sh; ./opt/sandbox/setup.sh install;
    echo
fi

#Bloodhound
if [ -d /opt/BloodHound/.git ]; then
     echo -e "${BLUE}Updating BloodHound.${NC}"
     cd /opt/BloodHound/ ; git pull
     echo
else
     echo -e "${YELLOW}Installing BloodHound.${NC}"
     git clone https://github.com/adaptivethreat/BloodHound.git /opt/BloodHound
     echo
fi

#Cobalt Strike Profiles
if [ -d /opt/cobaltstrike-profiles/.git ]; then
     echo -e "${BLUE}Updating Cobalt Strike profiles.${NC}"
     cd /opt/cobaltstrike-profiles/ ; git pull
     echo
else
     echo -e "${YELLOW}Installing Cobalt Strike profiles.${NC}"
     git clone https://github.com/rsmudge/Malleable-C2-Profiles.git /opt/cobaltstrike-profiles
     echo
fi

#CrackMapExec
if [ -d /opt/crackmapexec/.git ]; then
     echo -e "${BLUE}Updating CrackMapExec.${NC}"
     cd /opt/crackmapexec/ ; git pull
     echo
else
     echo -e "${YELLOW}Installing CrackMapExec.${NC}"
     git clone --recursive https://github.com/byt3bl33d3r/CrackMapExec.git /opt/crackmapexec
     cd /opt/crackmapexec ; pip install -r requirements ; python setup.py install
     ln -s /usr/local/bin/cme /opt/crackmapexec/crackmapexec
     echo
fi

#Discover
if [ -d /opt/discover/.git ]; then
     echo -e "${BLUE}Updating Discover.${NC}"
     cd /opt/discover ; git pull
     echo
fi

#Domain Hunter
if [ -d /opt/domainhunter/.git ]; then
     echo -e "${BLUE}Updating Domain Hunter.${NC}"
     cd /opt/domainhunter/ ; git pull
     echo
else
     echo -e "${YELLOW}Installing Domain Hunter.${NC}"
     git clone https://github.com/threatexpress/domainhunter.git /opt/domainhunter
     cd /opt/domainhunter/
     pip3 install -r requirements.txt
     chmod 755 domainhunter.py
     echo
fi

#Domain Password Spray
if [ -d /opt/DomainPasswordSpray/.git ]; then
     echo -e "${BLUE}Updating DomainPasswordSpray.${NC}"
     cd /opt/DomainPasswordSpray/ ; git pull
     echo
else
     echo -e "${YELLOW}Installing DomainPasswordSpray.${NC}"
     git clone https://github.com/dafthack/DomainPasswordSpray.git /opt/DomainPasswordSpray
     echo
fi

#Empire
if [ -d /opt/Empire/.git ]; then
     echo -e "${BLUE}Updating Empire.${NC}"
     cd /opt/Empire/ ; git pull
     echo
else
     echo -e "${YELLOW}Installing Empire.${NC}"
     git clone https://github.com/PowerShellEmpire/Empire.git /opt/Empire
     /opt/Empire/setup/install.sh
     echo
fi

#libxml2
if [ ! -f /usr/bin/xmllint ]; then
     echo -e "${YELLOW}Installing libxml2-utils.${NC}"
     apt-get install -y libxml2-utils
     echo
fi

#PowerSploit
if [ -d /opt/PowerSploit/docs ]; then
     echo -e "${BLUE}Updating PowerSploit.${NC}"
     cd /opt/PowerSploit/ ; git pull
     echo
else
     echo -e "${YELLOW}Installing PowerSploit.${NC}"
     rm -rf /opt/PowerSploit 2>/dev/null
     git clone -b dev https://github.com/PowerShellMafia/PowerSploit/ /opt/PowerSploit
echo
fi

#PowerUpSQL
if [ -d /opt/PowerUpSQL/.git ]; then
     echo -e "${BLUE}Updating PowerUpSQL.${NC}"
     cd /opt/PowerUpSQL/ ; git pull
     echo
else
     echo -e "${YELLOW}Installing PowerUpSQL.${NC}"
     git clone https://github.com/NetSPI/PowerUpSQL.git /opt/PowerUpSQL
     echo
fi

#PS>Attack
if [ -d /opt/PS-Attack/.git ]; then
     echo -e "${BLUE}Updating PS>Attack.${NC}"
     cd /opt/PS-Attack/ ; git pull
     echo
else
     echo -e "${YELLOW}Installing PS>Attack.${NC}"
     git clone https://github.com/jaredhaight/PSAttack.git /opt/PS-Attack
     echo
fi

#RAWR
if [ -d /opt/rawr/.git ]; then
     echo -e "${BLUE}Updating RAWR.${NC}"
     cd /opt/rawr/ ; git pull
     echo
else
     echo -e "${YELLOW}Installing RAWR.${NC}"
     git clone https://bitbucket.org/al14s/rawr.git /opt/rawr
     /opt/rawr/install.sh y
fi

#Unicorn
if [ -d /opt/unicorn/.git ]; then
     echo -e "${BLUE}Updating unicorn.${NC}"
     cd /opt/unicorn/ ; git pull
     echo
else
     echo -e "${YELLOW}Installing unicorn.${NC}"
     git clone https://github.com/trustedsec/unicorn.git /opt/unicorn
     echo
fi

#Veil
if [ -d /opt/Veil/.git ]; then
     echo -e "${BLUE}Updating Veil.${NC}"
     cd /opt/Veil/ ; git pull
     echo
else
     echo -e "${YELLOW}Installing Veil.${NC}"
     git clone https://github.com/Veil-Framework/Veil /opt/Veil
     echo
fi

#xdotool
if [ ! -f /usr/bin/xdotool ]; then
     echo -e "${YELLOW}Installing xdotool.${NC}"
     apt-get install -y xdotool
     echo
fi

#xlsx2csv
if [ ! -f /usr/bin/xlsx2csv ]; then
     echo -e "${YELLOW}Installing xlsx2csv.${NC}"
     apt-get install -y xlsx2csv
     echo
fi

#xml_grep
if [ ! -f /usr/bin/xml_grep ]; then
     echo -e "${YELLOW}Installing xml_grep.${NC}"
     apt-get install -y xml-twig-tools
     echo
fi

echo -e "${BLUE}Updating locate database.${NC}" ; updatedb

echo
echo
