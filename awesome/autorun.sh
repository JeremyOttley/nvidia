#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

# run pulseeffects

## in rc.lua
# awful.spawn.with_shell("~/.config/awesome/autorun.sh")
