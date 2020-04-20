#!/usr/bin/env bash

RED="$(tput setaf 1)"
YELLOW="$(tput setaf 3)"
GREEN="$(tput setaf 2)"

function customize_ps1() {
    if [ -n "$1" ]; then
        case "$1" in
          *prod*)
            echo -e "${_KUBE_PS1_OPEN_ESC}${RED}${_KUBE_PS1_CLOSE_ESC}${1}"
            ;;
          *staging*)
            echo -e "${_KUBE_PS1_OPEN_ESC}${YELLOW}${_KUBE_PS1_CLOSE_ESC}${1}"
            ;;
          *)
            echo -e "${_KUBE_PS1_OPEN_ESC}${GREEN}${_KUBE_PS1_CLOSE_ESC}${1}"
            ;;
        esac
    fi
}

KUBE_PS1_CLUSTER_FUNCTION=customize_ps1