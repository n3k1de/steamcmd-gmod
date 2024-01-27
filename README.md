# Garry's mod Server

## Variables
| __Name__ | __Default__ | __Info__ |
| ---- | ---- | ---- |
| __SERVERNAME__ |  | Name of the server |
| __PORT__ | 27015 | Sets port for a listen server |
| __CLIENTPORT__ | 27005 | Sets the client port. Specifies which port to use to communicate with a server |
| __MAXPLAYERS__ | 16 | Set the maximum players allowed to join the server |
| __GAMEMODE__ |  | Set the gamemode the server is using |
| __MAP__ | gm_construct | For example 'gm_construct' or the name of the workshop item |
| __PASSWD__ |  | The Password needed to join the server |
| __RCONPASSWD__ |  | The admin password. `openssl rand -base64 32` |
| __APIKEY__ |  | The steam webapi key (needed to load workshop collections) [get an webapi key here](https://steamcommunity.com/dev/apikey) |
| __WORKSHOPCOLLECTION__ |  | The id of the collection. _To be found in the URL of the collection_ |
| __SERVERACCOUNT__ |  | Needed to connect to the server from the internet. [get an account key here](https://steamcommunity.com/dev/managegameservers)
| __SUPERADMIN__ |  | Admin of the server |

## Server manage
* create your own server: 
```
docker run -d -t \
  -p 27015:27015/tcp \
  -p 27015:27015/udp \
  -p 27005:27005/tcp \
  -p 27005:27005/udp \
  -e APIKEY="*****" \
  -e WORKSHOPCOLLECTION="*****" \
  -e SERVERACCOUNT="*****" \
  --name="gmod" netherkids/steamcmd-gmod
```
* The advaced way:
```
docker run -d -t \
  -p 27015:27015/tcp \
  -p 27015:27015/udp \
  -p 27005:27005/tcp \
  -p 27005:27005/udp \
  -e SERVERNAME="docker gmod server" \
  -e PORT=27015 \
  -e CLIENTPORT=27005 \
  -e MAXPLAYERS=4 \
  -e GAMEMODE="sandbox" \
  -e SERVERNAME="*****" \
  -e MAP="*****" \
  -e PASSWD="" \
  -e RCONPASSWD="*****" \
  -e APIKEY="*****" \
  -e WORKSHOPCOLLECTION="*****" \
  -e SERVERACCOUNT="*****" \
  --name="gmod" netherkids/steamcmd-gmod
```


* view the console output: 
  * `docker logs gmod`
* run a command on the server: 
  * `docker exec gmod "say hi"`
  * `docker exec gmod "ulx adduser <name> superadmin"`
* change a variable (reboot needed): 
  * `docker exec -e gmod MAP="*****"`

## Join the server
* press the '_windows key_' and '_R_'.
* type in: `steam://connect/<IP or Domain name>[:<port>][/<password>]`.
* Replace in the IP or Domain name of the server.
  * `steam://connect/exemple.com`
* Replace the port or password if needed.
  * `steam://connect/exemple.com:27015/server_password`
* press return to join.
