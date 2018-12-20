#!/bin/bash

#Host Discovery
git clone https://github.com/google/grr /opt/grr; 

#Red Team Field Manual
git clone https://github.com/leostat/rtfm.git /opt/rtfm/;  chmod +x /opt/rtfm/rtfm.py; /opt/rtfm/rtfm.py -u;
