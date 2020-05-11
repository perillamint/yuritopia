#!/bin/bash

FILENAME="$1"
CONTAINER="$2"
OPTS="${@:3}"

TMPFILE="tmp-$$.$CONTAINER"

echo $TMPFILE

set -e
echo ffmpeg -i "$FILENAME" $OPTS "$TMPFILE"
ffmpeg -i "$FILENAME" $OPTS "$TMPFILE"
mv -f "$TMPFILE" "$FILENAME"
