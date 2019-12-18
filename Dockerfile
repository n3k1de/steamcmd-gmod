FROM djustde/steamcmd
MAINTAINER DJustDE <docker@djust.de>

EXPOSE 27015/tcp 27015/udp 27005/udp 27020/udp 26900/udp 51840/udp 80/tcp 443/tcp

ENV GAME gmod
ENV STEAMCMDDIR /home/steam

ENV PORT=27015
ENV PORTTV=27020
ENV CLIENTPORT=27005
ENV SPORT=26900
ENV MAXPLAYERS=12
ENV GAMEMODE=terrortown
ENV MAP=gm_construct
ENV SERVERNAME=
ENV PASSWD=
ENV RCONPASSWD=
ENV WORKSHOPCOLLECTION=
ENV APIKEY=
ENV SERVERACCOUNT=

RUN chmod 0775 /opt/ && chown steam.steam /opt/ && \
    su steam -c "mkdir -p ${STEAMCMDDIR} ${SERVERDIR} /home/steam/.steam/sdk32/

COPY /data/ /opt/
RUN chmod 0775 /opt/entrypoint.sh && chown steam.steam /opt/entrypoint.sh && \
    su steam -c "${STEAMCMDDIR}/steamcmd.sh +login anonymous +quit"

USER steam
WORKDIR ${STEAMCMDDIR}
VOLUME ${SERVERDIR}
ENTRYPOINT ["/opt/entrypoint.sh"]
