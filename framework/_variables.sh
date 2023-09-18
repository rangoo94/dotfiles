#!/bin/bash

VAR_PREFIX="_DOTVAR_"

# Load variables definition

source "$(dirname "${BASH_SOURCE[0]}")/../config/variables.sh"

# Load existing configuration

DOTCONFIG_PATH="$(dirname "${BASH_SOURCE[0]}")/../.dotconfig"
if test -f "$DOTCONFIG_PATH"; then
  source "$DOTCONFIG_PATH"
fi

# Configure helpers

variable_save() {
  # "name" "value"
  echo "$VAR_PREFIX$1=\"$(echo "$2" | sed 's/"/\\"/g')\"" >> $DOTCONFIG_PATH
  source "$DOTCONFIG_PATH"
}

variable_ask_raw() {
  # "name" "description" "default"
  echo $BOLD_CYAN"$1:"$FORMAT_END$GRAY" (default: $3)"$FORMAT_END
  read -p $BOLD_CYAN"   $2: "$FORMAT_END value
}

variable_get_raw() {
  # "name"
  name="$VAR_PREFIX$1"
  echo ${!name}
}

variable_get() {
  # "name"
  value="$(variable_get_raw $1)"

  if ! [[ "$value" ]]; then
    panic "The '$1' variable has not been configured."
  fi

  echo "$value"
}

variable_is_true() {
  # "name"
  name="$1"

  if [[ $(variable_get "$name") == "true" ]]; then
    return 0
  fi
}

variable_ask() {
  # "type" "name" "description" "default"
  type="$1"
  name="$2"
  description="$3"
  default_value="$4"

  # Read new value
  while true; do
    if [[ "$type" == "bool" ]]; then
      variable_ask_raw "$name" "$description (y/n)" "$default_value"
      if ! [[ "$value" ]]; then
        value="$default_value"
      fi
      case "$value" in
        y|Yes|yes)
          variable_save "$name" "true"
          break
          ;;
        n|N|No|no)
          variable_save "$name" "false"
          break
          ;;
        *)
          echo $BOLD_RED"   Invalid answer. Enter \"y/yes\" or \"N/no\""$FORMAT_END
      esac
    elif [[ "$type" == "email" ]]; then
      variable_ask_raw "$name" "$description" "$default_value"
      if ! [[ "$value" ]]; then
        value="$default_value"
      fi

      if ! [[ "$value" == *"@"* ]]; then
        echo $BOLD_RED"   Invalid e-mail address"$FORMAT_END
        continue
      fi

      variable_save "$name" "$value"
      break
    elif [[ "$type" == "text" ]]; then
      variable_ask_raw "$name" "$description" "$default_value"
      if ! [[ "$value" ]]; then
        value="$default_value"
      fi

      variable_save "$name" "$value"
      break
    elif [[ "$type" == "password" ]]; then
      echo $BOLD_CYAN"$name:"$FORMAT_END
      echo -n $BOLD_CYAN"   $description: "$FORMAT_END
      read -s value

      if ! [[ "$value" ]]; then
        echo
        echo $BOLD_RED"   Password is required"$FORMAT_END
        continue
      fi

      echo -e "\r                                                              \r"
      echo -n $BOLD_CYAN"   Repeat password: "$FORMAT_END
      read -s value2
      echo

      if ! [[ "$value" == "$value2" ]]; then
        echo $BOLD_RED"   Passwords do not match"$FORMAT_END
        continue
      fi

      variable_save "$name" "$value"
      break
    else
      panic $BOLD_RED"Unknown variable type"$FORMAT_END
    fi
  done
}

variable_ask_if_not_exists() {
  # "type" "name" "description" "default"
  type="$1"
  name="$2"
  description="$3"
  default_value="$4"
  value="$(variable_get_raw "$name")"

  # Ignore if value already exists
  if [[ "$value" ]]; then
    if [[ "$type" == "password" ]]; then
      echo $BOLD_CYAN"$name: "$FORMAT_END"********"
    else
      echo $BOLD_CYAN"$name: "$FORMAT_END"${value}"
    fi
    continue
  fi

  variable_ask "$type" "$name" "$description" "$default_value"
}

variable_wizard() {
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

    variable_ask_if_not_exists "$type" "$name" "$description" "$default_value"
  done
}