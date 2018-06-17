#!/bin/bash

BG_PATH="$HOME/Imatges/$1"

wal -i $BG_PATH -n
feh --bg-fill $BG_PATH --no-fehbg

