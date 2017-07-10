# docker-discord
A Docker image that start a fresh discord client. 

[![Circle CI](https://circleci.com/gh/xorilog/docker-discord.svg?style=shield)](https://circleci.com/gh/xorilog/docker-discord)  
[![Image Layers](https://images.microbadger.com/badges/image/xorilog/discord.svg)](https://microbadger.com/images/xorilog/discord)   


## Usage
To spawn a new instance of Discord:

```shell
docker run --rm -it --name discord \
       -v /tmp/.X11-unix:/tmp/.X11-unix \
       -e DISPLAY=unix$DISPLAY \
       --device /dev/snd \
       -v /etc/localtime:/etc/localtime:ro \
       -v <Your_storage_dir>/.config/discord/:/root/.config/discord/ \
       xorilog/discord
```
## Issues
* You have to log out Discord to close the docker container.  


## FAQ
### Docker <1.8
Before Docker 1.8 you need to replace `--device /dev/snd` by `-v /dev/snd:/dev/snd --privileged`.  


### QXcbConnection: Could not connect to display unix:0
```shell
xhost +
```
do not forget to remove it after start or usage (`xhost -`)  
The previous command is to be run on a linux machine. But Mac users, I have a special surprise for you. You can also do fun hacks with X11. Details are described [here](https://github.com/docker/docker/issues/8710).


Thanks to [Discord](https://discordapp.com/) for their great app !
