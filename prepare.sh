#!/bin/bash

set -e

VERSION=v1.7.1

if [ -f renpy-switch-sdk/versionmarker ]; then
    if [ $(cat renpy-switch-sdk/versionmarker) == "$VERSION" ]; then
        exit 0;
    fi
fi

if [ -d renpy-switch-sdk ]; then
    rm -rf renpy-switch-sdk
fi

wget https://github.com/uyjulian/renpy-switch/releases/download/"$VERSION"/renpy-switch-sdk-"$VERSION".7z
mkdir -p renpy-switch-sdk
pushd renpy-switch-sdk
7z x ../renpy-switch-sdk-"$VERSION".7z
rm -f ../renpy-switch-sdk-"$VERSION".7z
#mv renpy-switch-sdk-"$VERSION" renpy-switch-sdk
popd
echo "$VERSION" > renpy-switch-sdk/versionmarker
