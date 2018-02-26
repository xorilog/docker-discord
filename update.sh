#!/bin/bash

# Gather latest version of discord
version=$(curl --head "https://discordapp.com/api/download?platform=linux&format=tar.gz" |grep -i location |cut -d '/' -f 6)

sed -i 's/Discord\ Version\ [0-9]*\.[0-9]*\.[0-9]*$/\Discord\ Version\ '$version'/' Dockerfile
sed -i 's/linux\/[0-9]*\.[0-9]*\.[0-9]*\/discord-[0-9]*\.[0-9]*\.[0-9]*/linux\/'$version'\/discord-'$version'/' Dockerfile

git commit -am "Discord version $version" -S
git tag -am "Discord version $version" $version
git push --follow-tags
