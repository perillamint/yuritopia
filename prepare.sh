#!/bin/bash

VERSION=v1.7

wget https://github.com/uyjulian/renpy-switch/releases/download/"$VERSION"/renpy-switch-sdk-"$VERSION".7z
7z x renpy-switch-sdk-"$VERSION".7z
rm -f renpy-switch-sdk-"$VERSION".7z
mv renpy-switch-sdk-"$VERSION" renpy-switch-sdk
