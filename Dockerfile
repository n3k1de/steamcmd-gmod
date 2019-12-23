FROM djustde/steamcmd
MAINTAINER DJustDE <docker@djust.de>

# --> 27015/tcp=Rcon; 27015/udp=information; 27005/udp=client; 27020/udp=SourceTV; 26900/udp=steam
# EXPOSE 27015/tcp 27015/udp 27005/udp 27020/udp 26900/udp 51840/udp 80/tcp 443/tcp
EXPOSE 26900-26905/udp 27015-27020/tcp 27015-27020/udp 27215/udp 4242/udp

ENV GAME gmod
ENV SERVERDIR /opt/server

ENV PORT=27015
ENV PORTTV=27020
ENV CLIENTPORT=27005
ENV SPORT=26900
ENV MAXPLAYERS=12
ENV GAMEMODE=terrortown
ENV MAP=gm_construct
ENV PASSWD=
ENV RCONPASSWD=
ENV WORKSHOPCOLLECTION=
ENV APIKEY=
ENV SERVERACCOUNT=

RUN chmod 0775 /opt/ && chown steam.steam /opt/ && \
    su steam -c "mkdir -p ${SERVERDIR} && cd ${STEAMCMDDIR} && ${STEAMCMDDIR}/steamcmd.sh +login anonymous +quit"

COPY /data/ /opt/
RUN chmod 0775 /opt/entrypoint.sh && chown steam.steam /opt/entrypoint.sh

WORKDIR ${STEAMCMDDIR}
VOLUME ${SERVERDIR}
ENTRYPOINT ["/opt/entrypoint.sh"]
