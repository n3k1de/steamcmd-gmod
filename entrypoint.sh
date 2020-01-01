#!/bin/sh

ulimit -n 2048‬
IP="$(curl -4 https://djust.de/dns/ip)"
cd ${STEAMCMDDIR}

if [ -e "/home/steam/.steam/sdk32/steamclient.so" ]
then
  echo "steamclient.so found."
else
  echo "steamclient.so not found."
  su steam -c "ln -s ${STEAMCMDDIR}/linux32/steamclient.so ~/.steam/sdk32/steamclient.so"
  if [ -e "/home/steam/.steam/sdk32/steamclient.so" ]
  then
    echo "steamclient.so link created."
  fi
fi

rm ./start.sh
wget -O start.sh https://raw.githubusercontent.com/djust-de/steamcmd/master/bash/garrysmod-start.sh
chmod -R 0775 ./start.sh && chown -R steam ./start.sh ${STEAMCMDDIR} ${SERVERDIR}
su steam -c "./start.sh"
