#!/bin/bash

BOLD=$'\e[1m'
BOLD_CYAN=$'\e[1;36m'
BOLD_MAGENTA=$'\e[1;35m'
BOLD_RED=$'\e[1;31m'
CYAN=$'\e[0;36m'
GRAY=$'\e[0;37m'
GREEN=$'\e[0;32m'
RED=$'\e[0;31m'
FORMAT_END=$'\e[0m'

header() {
  COLS=$(tput cols)
  TEXT_LENGTH=${#1}
  COLS_AVAILABLE=$(($COLS - $TEXT_LENGTH - 2))
  LEFT_SIDE_SIZE=5
  RIGHT_SIDE_SIZE=$(($COLS_AVAILABLE - $LEFT_SIDE_SIZE))
  LEFT_SIDE=$(/bin/bash -c "echo -n '█'{1..$LEFT_SIDE_SIZE} | sed 's/[ 0-9]//g'")
  RIGHT_SIDE=$(/bin/bash -c "echo -n '█'{1..$RIGHT_SIDE_SIZE} | sed 's/[ 0-9]//g'")
  echo $'\n'$BOLD_CYAN$LEFT_SIDE" $1 "$RIGHT_SIDE$FORMAT_END$'\n'
}

info() {
  echo $BOLD"$@"$FORMAT_END
}

success() {
  echo $GREEN"$@"$FORMAT_END
}

error() {
  echo $RED"$@"$FORMAT_END
}

panic() {
  echo $RED"$@"$FORMAT_END
  exit 1
}
