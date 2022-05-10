#!/bin/bash

# Load existing configuration

DOTCONFIG_PATH="$(dirname "${BASH_SOURCE[0]}")/../config/.dotconfig"
if test -f "$DOTCONFIG_PATH"; then
  source "$DOTCONFIG_PATH"
fi

# Define required variables

source "$(dirname "${BASH_SOURCE[0]}")/../config/variables.sh"

# Define helpers

BOLD=$'\e[1m'
RED=$'\e[0;31m'
CYAN=$'\e[0;36m'
GRAY=$'\e[0;37m'
FORMAT_END=$'\e[0m'

save() {
  # "name" "value"
  echo "$1=$2" >> $DOTCONFIG_PATH
  source "$DOTCONFIG_PATH"
}

ask() {
  # "name" "description" "default"
  echo $BOLD$CYAN"$1:"$FORMAT_END$GRAY" (default: $3)"$FORMAT_END
  read -p $BOLD$CYAN"   $2: "$FORMAT_END value
}

# Request all missing variables

num="-1"
name=""
description=""
type=""
default_value=""
for variable in "${VARIABLES_DEFINITION[@]}"
do
  # Extract values
  num="$(($num + 1))"
  if [[ "$(($num % 4))" == "0" ]]; then
    name="$variable"
    continue
  elif [[ "$(($num % 4))" == "1" ]]; then
    description="$variable"
    continue
  elif [[ "$(($num % 4))" == "2" ]]; then
    type="$variable"
    continue
  elif [[ "$(($num % 4))" == "3" ]]; then
    default_value="$variable"
  fi

  # Ignore if value already exists
  if [[ "${!name}" ]]; then
    if [[ "$type" == "password" ]]; then
      echo $BOLD$CYAN"$name: "$FORMAT_END"********"
    else
      echo $BOLD$CYAN"$name: "$FORMAT_END"${!name}"
    fi
    continue
  fi

  # Read new value
  while true; do
    if [[ "$type" == "bool" ]]; then
      ask "$name" "$description (y/n)" "$default_value"
      if ! [[ "$value" ]]; then
        value="$default_value"
      fi
      case "$value" in
        y|Yes|yes)
          save "$name" "true"
          break
          ;;
        n|N|No|no)
          save "$name" "false"
          break
          ;;
        *)
          echo $BOLD$RED"   Invalid answer. Enter \"y/yes\" or \"N/no\""$FORMAT_END
      esac
    elif [[ "$type" == "email" ]]; then
      ask "$name" "$description" "$default_value"
      if ! [[ "$value" ]]; then
        value="$default_value"
      fi

      if ! [[ "$value" == *"@"* ]]; then
        echo $BOLD$RED"   Invalid e-mail address"$FORMAT_END
        continue
      fi

      save "$name" "$value"
      break
    elif [[ "$type" == "text" ]]; then
      ask "$name" "$description" "$default_value"
      if ! [[ "$value" ]]; then
        value="$default_value"
      fi

      save "$name" "$value"
      break
    elif [[ "$type" == "password" ]]; then
      echo $BOLD$CYAN"$name:"$FORMAT_END
      echo -n $BOLD$CYAN"   $description: "$FORMAT_END
      read -s value

      if ! [[ "$value" ]]; then
        echo
        echo $BOLD$RED"   Password is required"$FORMAT_END
        continue
      fi

      echo -e "\r                                                              \r"
      echo -n $BOLD$CYAN"   Repeat password: "$FORMAT_END
      read -s value2
      echo

      if ! [[ "$value" == "$value2" ]]; then
        echo $BOLD$RED"   Passwords do not match"$FORMAT_END
        continue
      fi

      save "$name" "$value"
      break
    else
      echo $BOLD$RED"Unknown variable type"$FORMAT_END
      exit 1
    fi
  done
done
