#!/bin/bash

if variable_is_true "IS_WORK"; then
  header "Setup Kubernetes aliases"

  bashrc_snippet "Kubernetes aliases" "
    k() {
      kubectl \$@
    }
    kc() {
      kubectx \$@
    }
    kctx() {
      kubectx \$@
    }
    kns() {
      kubens \$@
    }
  "

  bashrc_snippet "Telepresence aliases" "
    tp() {
      telepresence \$@
    }
    tps() {
      tp status
    }
    tpc() {
      tp connect
    }
    tpq() {
      tp quit
    }
  "
fi
