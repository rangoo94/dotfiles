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
    kd() {
      kubectl describe \$@
    }
    kg() {
      kubectl get \$@
    }
    kl() {
      kubectl logs \$@
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

  header "Install Telepresence"

  telepresence_version=2.17.0
  arch="darwin-$(uname -m)"
  if [[ "$arch" != "darwin-arm64" ]]; then
    arch="darwin-amd64"
  fi
  sudo curl -fL https://app.getambassador.io/download/tel2oss/releases/download/v$telepresence_version/telepresence-$arch -o /usr/local/bin/telepresence
  sudo chmod a+x /usr/local/bin/telepresence
fi
