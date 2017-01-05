#!/bin/bash

COLOR_NC='\e[0m' # No Color
COLOR_WHITE='\e[1;37m'
COLOR_BLACK='\e[0;30m'
COLOR_BLUE='\e[0;34m'
COLOR_LIGHT_BLUE='\e[1;34m'
COLOR_GREEN='\e[0;32m'
COLOR_LIGHT_GREEN='\e[1;32m'
COLOR_CYAN='\e[0;36m'
COLOR_LIGHT_CYAN='\e[1;36m'
COLOR_RED='\e[0;31m'
COLOR_LIGHT_RED='\e[1;31m'
COLOR_PURPLE='\e[0;35m'
COLOR_LIGHT_PURPLE='\e[1;35m'
COLOR_BROWN='\e[0;33m'
COLOR_YELLOW='\e[1;33m'
COLOR_GRAY='\e[0;30m'
COLOR_LIGHT_GRAY='\e[0;37m'

msg_nc () {
  echo -n -e "$COLOR_NC"
}
msg_white () {
  echo -n -e "$COLOR_WHITE"
}
msg_black () {
  echo -n -e "$COLOR_BLACK"
}
msg_blue () {
  echo -n -e "$COLOR_BLUE"
}
msg_light_blue () {
  echo -n -e "$COLOR_LIGHT_BLUE"
}
msg_green () {
  echo -n -e "$COLOR_GREEN"
}
msg_light_green () {
  echo -n -e "$COLOR_LIGHT_GREEN"
}
msg_cyan () {
  echo -n -e "$COLOR_CYAN"
}
msg_light_cyan () {
  echo -n -e "$COLOR_LIGHT_CYAN"
}
msg_red () {
  echo -n -e "$COLOR_RED"
}
msg_light_red () {
  echo -n -e "$COLOR_LIGHT_RED"
}
msg_purple () {
  echo -n -e "$COLOR_PURPLE"
}
msg_light_purple () {
  echo -n -e "$COLOR_LIGHT_PURPLE"
}
msg_brown () {
  echo -n -e "$COLOR_BROWN"
}
msg_yellow  () {
  echo -n -e "$COLOR_YELLOW"
}
msg_gray () {
  echo -n -e "$COLOR_GRAY"
}
msg_light_gray () {
  echo -n -e "$COLOR_LIGHT_GRAY"
}
