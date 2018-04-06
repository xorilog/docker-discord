#!/bin/bash

# Gather latest version of discord
version=$(curl --head "https://discordapp.com/api/download?platform=linux&format=tar.gz" |grep location |cut -d '/' -f 6)
sed -i 's/\(Discord Version \)[0-9]*\.[0-9]*\.[0-9]*$/\1'$version'/' Dockerfile
sed -i 's/\(\/linux\/\).*\(\/discord-\).*\(.tar.gz -O\)/\1'$version'\2'$version'\3/' Dockerfile
git commit -am "Discord version $version" #-S
git tag -am "Discord version $version" $version
git push --follow-tags
