# Garry's mod Server

## Required games on Steam (installed):
* [Garry's mod](https://store.steampowered.com/app/4000/Garrys_Mod/)
* [Counter-Strike: Source](https://store.steampowered.com/app/240/CounterStrike_Source/?l=german)
* [Team Fortress 2](https://store.steampowered.com/app/440/Team_Fortress_2/)

## Variables
* __MAP:__ For example 'gm_construct' or the name of the workshop item.
* __PASSWD:__ The Password needed to join the server.
* __RCONPASSWD:__ The admin password. [here you find a password generator](https://passwordsgenerator.net)
* __APIKEY:__ The steam webapi key (needed to load workshop collections). [get an webapi key here](https://steamcommunity.com/dev/apikey).
* __WORKSHOPCOLLECTION:__ The id of the collection. _To be found in the URL of the collection._
* __SERVERACCOUNT:__ Needed to connect to the server from the internet. [get an account key here](https://steamcommunity.com/dev/managegameservers).

## Server manage
* create your own server: 
```
docker run -d -t \
  -p 27015:27015/tcp \
  -p 27015:27015/udp \
  -p 27005:27005/tcp \
  -p 27005:27005/udp \
  -p 27020:27020/udp \
  -e SERVERNAME="*****" \
  -e MAP="*****" \
  -e PASSWD="" \
  -e RCONPASSWD="*****" \
  -e APIKEY="*****" \
  -e WORKSHOPCOLLECTION="*****" \
  -e SERVERACCOUNT="*****" \
  --hostname="gmod.exemple.com" \
  --name="gmod" djustde/gmod:latest
```
* view the console output: `docker logs gmod`
* run a command on the server: `docker exec gmod "say hi"`
* change a variable (reboot needed): `docker exec -e gmod MAP="*****"`

### Join the server
* press the '_windows key_' and '_R_'.
* put in: `steam://connect/<IP or Domain name>[:<port>][/<password>]`.
* Replace in the IP or Domain name of the server.
  - as example: `steam://connect/exemple.com`
* Replace the port or password if needed.
  - as example: `steam://connect/exemple.com:27015/server_password`
* press return.
