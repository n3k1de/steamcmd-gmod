# Garry's mod Server

## Required games on Steam (installed):
* [Garry's mod](https://store.steampowered.com/app/4000/Garrys_Mod/)
* [Counter-Strike: Source](https://store.steampowered.com/app/240/CounterStrike_Source/?l=german)
* [Team Fortress 2](https://store.steampowered.com/app/440/Team_Fortress_2/)

## Variables
* __PORT:__ Sets port for a listen server. _Default is 27015._
* __CLIENTPORT:__ Sets the client port. Specifies which port to use to communicate with a server. _Default is 27005._
* __MAXPLAYERS:__ Set the maximum players allowed to join the server. This does the same as the maxplayers convar, the maximum you can set it to is limited by the game/mod
* __GAMEMODE:__ Set the gamemode the server is using. 
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
  -e APIKEY="*****" \
  -e WORKSHOPCOLLECTION="*****" \
  -e SERVERACCOUNT="*****" \
  --hostname="gmod.exemple.com" \
  --name="gmod" djustde/steamcmd-gmod:latest
```
* The advaced way:
```
docker run -d -t \
  -p 27015:27015/tcp \
  -p 27015:27015/udp \
  -p 27005:27005/tcp \
  -p 27005:27005/udp \
  -p 27020:27020/udp \
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
  --hostname="gmod.exemple.com" \
  --name="gmod" djustde/steamcmd-gmod:latest
```
* view the console output: 
```
docker logs gmod
```
* run a command on the server: 
```
docker exec gmod "say hi"
```
```
docker exec gmod "ulx adduser <name> superadmin"
```
* change a variable (reboot needed): 
```
docker exec -e gmod MAP="*****"
```

## Join the server
* press the '_windows key_' and '_R_'.
* put in: `steam://connect/<IP or Domain name>[:<port>][/<password>]`.
* Replace in the IP or Domain name of the server.
  - as example: `steam://connect/exemple.com`
* Replace the port or password if needed.
  - as example: `steam://connect/exemple.com:27015/server_password`
* press return to join.
