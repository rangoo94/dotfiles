#!/bin/bash

header "Installing snippets"

bashrc_snippet "User memory and CPU" "
  used() {
    (echo 'user cpu% rss';
      for user in \$(users | tr ' ' '\n' | sort -u); do
        echo \"\$user \$(ps -U \$user -o rss=,%cpu= | sed s/,/./g | awk '{rss+=\$1; cpu+=\$2} END{print cpu \" \" int(rss/1024) \" MiB\"}')\"
      done | sort -k3
    ) | column -t
  }
"
