#!/bin/bash

source gamecfg

# Pre-flight check
echo "Checking command availabilities..."

FLAG=0

for i in fd unrpa rpatool ffmpeg cwebp 7z nacptool elf2nro; do
	command -v "$i" > /dev/null
	if [ "$?" != 0 ]; then
		echo "$i is not available."
		FLAG=1
	fi
done

if [ "$FLAG" == 1 ]; then
	exit 1
fi

echo "Preflight check passed."

if [ ! -d "kindredspirits-fc-pc" ]; then
	echo "Game is not extracted in kindredspirits-fc-pc folder."
	echo "Please extract game zip in this directory and re-run this script"
	exit 1;
fi

set -e
rm -rfv renpy-switch-sdk

./prepare.sh

if [ -d game ]; then
	rm -rfv game
fi

cp -arv kindredspirits-fc-pc/game ./game

./convert.sh


echo "Ready to launch."

if [ -f control.nacp ]; then
	rm -f control.nacp
fi

nacptool --create "$GAMENAME" "$GAMEPUB" "$GAMEVER" control.nacp

if [ -f "$ARTIFACT" ]; then
	rm -f "$ARTIFACT"
fi

if [ -d Romfs ]; then
	rm -rf Romfs
fi

mkdir -p Romfs/Contents
mv ./game Romfs/Contents/

cp -f ./renpy-switch-sdk/lib.zip Romfs/Contents
cp -r ./renpy-switch-sdk/renpy Romfs/Contents
cp -r ./renpy-switch-sdk/renpy.py Romfs/Contents

elf2nro ./renpy-switch-sdk/renpy-switch.elf "$ARTIFACT" --romfsdir=Romfs --nacp=control.nacp --icon=./logo.jpg

