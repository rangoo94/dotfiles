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
