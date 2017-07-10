#!/bin/bash

# Gather latest version of discord
version=$(curl --head "https://discordapp.com/api/download?platform=linux&format=tar.gz" |grep Location |cut -d '/' -f 6)

sed -i 's/Discord\ Version\ [0-9]*\.[0-9]*\.[0-9]*$/\Discord\ Version\ '$version'/' Dockerfile
git commit -am "Discord version $version" -S
git tag -am "Discord version $version" $version
git push --follow-tags
