# docker-discord
A Docker image that start a fresh discord client. 

[![Circle CI](https://circleci.com/gh/xorilog/docker-discord.svg?style=shield)](https://circleci.com/gh/xorilog/docker-discord)  
[![Image Layers](https://images.microbadger.com/badges/image/xorilog/discord.svg)](https://microbadger.com/images/xorilog/discord)   


## Usage
To spawn a new instance of Discord:

```shell
USER=$(whoami);
xhost + local:discord; #allow discord to connect to X
docker run --rm -it \
	--name discord \
	--hostname discord \
	-v /home/$USER:/home/$USER \
	-e DISPLAY=$DISPLAY \
	-v /etc/group:/etc/group:ro \
	-v /etc/passwd:/etc/passwd:ro \
	-v /etc/shadow:/etc/shadow:ro \
	-v /tmp/.X11-unix:/tmp/.X11-unix:rw \
	-v /etc/localtime:/etc/localtime:ro \
	--user $(id -u) \
	--device /dev/snd \
	 discord;
xhost - local:discord; #remove discord from being allowed to connect to X
```
The previous commands is to be run on a linux machine. But Mac users, I have a special surprise for you. You can also do fun hacks with X11. Details are described [here](https://github.com/docker/docker/issues/8710).

## Issues
* You have to log out Discord or be sure 'minimize to try' is turned off in user settings under linux settings  to be able to close discord fully.   


## FAQ
### Docker <1.8
Before Docker 1.8 you need to replace `--device /dev/snd` by `-v /dev/snd:/dev/snd --privileged`.  

### 'QXcbConnection: Could not connect to display unix:0' or 'No protocol specified'
Some form of
```shell
xhost +
```
Before running is required to get this working and remember to remove after finished usage (`xhost -`)  


Thanks to [Discord](https://discordapp.com/) for their great app !
