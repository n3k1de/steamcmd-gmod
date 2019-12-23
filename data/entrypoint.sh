#!/bin/sh

ulimit -n 8192‬
IP="$(curl -4 https://djust.de/dns/ip)"
cd ${STEAMCMDDIR}

# wget -O start.sh https://play.djust.de/steamcmd/request/ttt/${HOSTNAME}/start.sh
wget -O start.sh https://raw.githubusercontent.com/djust-de/gmod/master/bash/start-gmod.sh 
chmod -R 0775 ./start.sh && chown -R steam ./start.sh ${STEAMCMDDIR} ${SERVERDIR}
su steam -c "ln -s ${STEAMCMDDIR}/linux32/steamclient.so ~/.steam/sdk32/steamclient.so && ./start.sh"
