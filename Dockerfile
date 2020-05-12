FROM netherkids/steamcmd
MAINTAINER NetherKidsDE <git@netherkids.de>

EXPOSE 27015/tcp 27015/udp 27005/tcp 27005/udp 27020/udp

ENV GAME="gmod" \
    SERVERDIR="/opt/server" \
    SERVERNAME="gmod_server" \
    PORT="27015" \
    CLIENTPORT="27005" \
    MAXPLAYERS="12" \
    GAMEMODE="sandbox" \
    MAP="gm_construct" \
    PASSWD="" \
    RCONPASSWD="" \
    WORKSHOPCOLLECTION="" \
    APIKEY="" \
    SERVERACCOUNT=""

COPY --chown=${USER}:${GROUP} /entrypoint.sh /
COPY --chown=${USER}:${GROUP} /healthcheck.py /

HEALTHCHECK  --interval=120s --timeout=60s CMD python3 /healthcheck.py ${PORT}

RUN chmod 0775 /opt/ /entrypoint.sh && chown ${USER}.${GROUP} /opt/ /entrypoint.sh && \
    su ${USER} -c "mkdir -p ${SERVERDIR} && cd ${STEAMCMDDIR} && ${STEAMCMDDIR}/steamcmd.sh +login anonymous +quit"

WORKDIR ${STEAMCMDDIR}
VOLUME ${SERVERDIR}
ENTRYPOINT ["/entrypoint.sh"]
