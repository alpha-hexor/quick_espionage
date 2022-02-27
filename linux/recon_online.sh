#!/bin/bash

#if internet is available download linpeas and execute it 
cd /tmp

curl --silent -L https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas.sh 
chmod +x linpeas.sh
bash linpeas.sh >> recon.log
