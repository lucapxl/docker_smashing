#!/bin/bash

function install_widgets() {
  WIDGETS=$@
  if [[ ! -z "$WIDGETS" ]]; then
    for WIDGET in $WIDGETS; do
      echo -e "\nInstalling widget from gist $WIDGET"
      smashing install "$WIDGET"
    done
  fi
}

if [ "$(ls -A /smashing)" ]; then
    echo "Smashing directory is not empty. I'm not going to create a new smashing dashboard"
    cd /smashing
    bundle install
else
    echo "Smashing directory is Empty: creating a new sample dashboard"
    cd /
    mkdir /smashing
    smashing new smashing
    cp /Gemfile /smashing/
    cd /smashing
    bundle
    bundle install 
fi

if [[ ! -e /installed ]]; then
  install_widgets $WIDGETS
  touch /installed
fi

if [[ ! -z "$PORT" ]]; then
  PORT_ARG="-p $PORT"
fi

# Start smashing
cd /smashing
exec smashing start $PORT_ARG
