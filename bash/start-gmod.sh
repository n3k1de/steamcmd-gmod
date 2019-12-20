#!/bin/bash

# update
# ${STEAMCMDDIR}/steamcmd.sh +login anonymous +quit
ln -s ${STEAMCMDDIR}/linux32/steamclient.so /home/steam/.steam/sdk32/steamclient.so
${STEAMCMDDIR}/steamcmd.sh +@sSteamCmdForcePlatformType linux +login anonymous \
 +force_install_dir "${SERVERDIR}/gmod/" +app_update 4020 -validate \
 +quit

# +force_install_dir "${SERVERDIR}/css" +app_update 232330 -validate \
# +force_install_dir "${SERVERDIR}/tf2" +app_update 232250 -validate \

# server start
cd ${SERVERDIR}/gmod/
# ./srcds_run -console -game garrysmod +sv_setsteamaccount ${SERVERACCOUNT} -authkey ${APIKEY} +host_workshop_collection ${WORKSHOPCOLLECTION} +port ${PORT} +tv_port ${PORTTV} +clientport ${CLIENTPORT} +maxplayers ${MAXPLAYERS} +gamemode ${GAMEMODE} +map ${MAP} -tickrate 66 -exec server.cfg
# ./srcds_run -game garrysmod -ip 0.0.0.0 +sv_setsteamaccount ${SERVERACCOUNT} +maxplayers ${MAXPLAYERS} +gamemode ${GAMEMODE} +map ${MAP}
echo "./srcds_run \
 -console \
 -game garrysmod \
 +maxplayers ${MAXPLAYERS} \
 +map ${MAP} \
 +sv_setsteamaccount ${SERVERACCOUNT} \
 +gamemode ${GAMEMODE} \
 +port ${PORT} \
 +clientport ${CLIENTPORT} \
 -authkey ${APIKEY} \
 +host_workshop_collection ${WORKSHOPCOLLECTION}"

./srcds_run \
 -game "garrysmod" \
 -console -nobreakpad -usercon -secure \
 -authkey "${APIKEY}" \
 -port ${PORT}
 +port ${PORT} \
 +clientport ${CLIENTPORT} \
 +maxplayers ${MAXPLAYERS} \
 +map "${MAP}" \
 +sv_setsteamaccount "${SERVERACCOUNT}" \
 +gamemode "${GAMEMODE}" \
 +sv_password "${PASSWD}" \
# +host_workshop_collection "${WORKSHOPCOLLECTION}"
