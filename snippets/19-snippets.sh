#!/bin/bash

header "Installing snippets"

bashrc_snippet "User memory and CPU" "
  used() {
    (echo 'user processes cpu% mem';
      nl=$'\n'
      for user in \$(ps -e -o user= | sort -u | uniq -u); do
        ps -U \$user -o rss=,%cpu= | sed s/,/./g | awk -v \"user=\$user\" 'BEGIN{rss=0; cpu=0; processes=0} {rss+=\$1; cpu+=\$2; processes+=1} END{print user \" \" processes \" \" cpu \" \" int(rss/1024) \" MiB\"}'
      done | sort -k4 -k2 -n
    ) | column -t
  }
"

bashrc_snippet "Watch Bash command" "
  watchb() {
    q=$'\"'
    cmd=\"\"
    args=\"watch \"
    was_opt=\"0\"
    is_cmd=\"0\"
    for arg in \"\$@\"; do
      if [ \"\$is_cmd\" -eq \"0\" ]; then
        if [[ \"\$arg\" = -* ]]; then
          args=\"\$args\$(printf \"%q \" \"\$arg\")\"
          was_opt=\"1\"
        elif [ \"\$was_opt\" -eq \"1\" ]; then
          args=\"\$args\$(printf \"%q \" \"\$arg\")\"
          was_opt=\"0\"
        else
          is_cmd=\"1\"
        fi
      fi
      if [ \"\$is_cmd\" -eq \"1\" ]; then
        cmd=\"\$cmd\$(printf \"%q\\ \" \"\$arg\")\"
      fi
    done
    init=\"\$(printf %q \"source ~/.bashrc; \")\"
    ev=\"\$(printf %q \"\$init\$cmd\")\"
    eval \$args bash -c \$ev
  }
"

bashrc_snippet "Watch Bash command diff" "
  watchdiff() {
    Q='\"'
    TITLE=\"\$(echo \$@)\"

    PREV_RESULT=\"\$(eval \$@)\"
    echo \$'\e[0;37m'\"\$(date +\"%Y-%m-%dT%H:%M:%S%z\")\"\$'\e[0m'\" \$(echo \"\$PREV_RESULT\" | sed 's/^/                         /' | sed '1 s/^                         //')\"
    while sleep 1; do
      RESULT=\$(eval \$@)
      if [ \"\$RESULT\" != \"\$PREV_RESULT\" ]; then
        echo \$'\e[0;37m'\"\$(date +\"%Y-%m-%dT%H:%M:%S%z\")\"\$'\e[0m'\" \$(echo \"\$RESULT\" | sed 's/^/                         /' | sed '1 s/^                         //')\"
        PREV_RESULT=\"\$RESULT\"

        DESCRIPTION=\"\$RESULT\"
        if [[ -x \"\$(command -v osascript)\" ]]; then
          osascript -e \"display notification \${Q}\$(echo \"\$DESCRIPTION\" | sed 's/\\\\/\\\\\\\\/g' | sed 's/\\\"/\\\\\"/g')\${Q} with title \${Q}\$(echo \"\$TITLE\" | sed 's/\\\\/\\\\\\\\/g' | sed 's/\\\"/\\\\\"/g')\${Q}\"
        fi
      fi
    done
  }

  watchdiff_silent() {
    Q='\"'
    TITLE=\"\$(echo \$@)\"

    PREV_RESULT=\"\$(eval \$@)\"
    echo \$'\e[0;37m'\"\$(date +\"%Y-%m-%dT%H:%M:%S%z\")\"\$'\e[0m'\" \$(echo \"\$PREV_RESULT\" | sed 's/^/                         /' | sed '1 s/^                         //')\"
    while sleep 1; do
      RESULT=\$(eval \$@)
      if [ \"\$RESULT\" != \"\$PREV_RESULT\" ]; then
        echo \$'\e[0;37m'\"\$(date +\"%Y-%m-%dT%H:%M:%S%z\")\"\$'\e[0m'\" \$(echo \"\$RESULT\" | sed 's/^/                         /' | sed '1 s/^                         //')\"
        PREV_RESULT=\"\$RESULT\"
      fi
    done
  }
"

bashrc_snippet "Help" "
  dotlist() {
    cat ~/.bashrc | grep -oE \"^[^(]*\\([ \"$'\t'\"]*\\)[ \"$'\t'\"]*\\{\" | grep -oE \"[^\"$'\t'\" (){]*\"
  }
"
