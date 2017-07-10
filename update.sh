#!/bin/bash

# Gather latest version of discord
#version=$(curl --head https://tdesktop.com/linux/ |grep Location |cut -d '/' -f 5 |cut -d '.' -f 2-4)
version=$(curl --head "https://discordapp.com/api/download?platform=linux&format=tar.gz" |grep Location |cut -d '/' -f 6)

### DISCORD ####
### DISCORD ####

sed -i 's/Discord\ Version\ [0-9]*\.[0-9]*\.[0-9]*$/\Discord\ Version\ '$version'/' Dockerfile
#sed -i 's/tsetup.*.tar.xz\ \-O/tsetup.'$version'.tar.xz\ \-O/' Dockerfile
git commit -am "Discord version $version" -S
git tag -am "Discord version $version" $version
git push --follow-tags
