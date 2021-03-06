#!/bin/bash


pushd ./game

set -e

NTHREAD=8
AUDIOBITRATE="96k"
VIDEOBITRATE="756k"

for i in *.rpa; do
	mkdir -p "$i-unpack"
	pushd "$i-unpack"
	unrpa "../$i"
	fd -j $NTHREAD --glob "*.png" -x ../../util/transcode-image.sh {} \;
	fd -j $NTHREAD --glob "*.webm" -x ../../util/transcode.sh {} mkv -c:v libvpx -b:v "$VIDEOBITRATE" -c:a libopus -b:a "$AUDIOBITRATE" \;
	#if [[ "$i" == voice* ]]; then
	#	AUDIOBITRATE="64k"
	#fi
	fd -j $NTHREAD --glob "*.opus" -x ../../util/transcode.sh {} webm -c:a libopus -b:a "$AUDIOBITRATE" \;
	fd -j $NTHREAD --glob "*.mp3" -x ../../util/transcode.sh {} webm -c:a libopus -b:a "$AUDIOBITRATE" \;
	fd -j $NTHREAD --glob "*.ogg" -x ../../util/transcode.sh {} webm -c:a libopus -b:a "$AUDIOBITRATE" \;
	rm "../$i"
	rpatool -2 -c "../$i" .
	popd
	rm -rfv "$i-unpack"
done

popd
