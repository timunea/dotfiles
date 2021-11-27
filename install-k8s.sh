#!/usr/bin/env bash

# Detect machine
unameOut="$(uname -s)"
case "${unameOut}" in
  Linux*)     MACHINE=Linux;;
  Darwin*)    MACHINE=Mac;;
  CYGWIN*)    MACHINE=Cygwin;;
  MINGW*)     MACHINE=MinGw;;
  *)          MACHINE="UNKNOWN:${unameOut}"
esac

echo $MACHINE

# Installs K8s for M1 Mac
if [[ $MACHINE == "Mac" ]]; then
    
    # Ask for the administrator password upfront
    sudo -v

    # Keep-alive: update existing `sudo` time stamp until `.macos` has finished
    while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

    ###############################################################################
    # Kubernetes                                                                  #
    ###############################################################################

    curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-arm64
    sudo install minikube-darwin-arm64 /usr/local/bin/minikube
fi

