#!/bin/bash

# Pre-flight check
echo "Checking command availabilities..."

FLAG=0

for i in fd unrpa rpatool ffmpeg cwebp 7z; do
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

mv ./game renpy-switch-sdk/

echo "Ready to launch."
