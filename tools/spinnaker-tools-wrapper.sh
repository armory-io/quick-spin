#!/usr/bin/env bash

###
# Ensure that the system has kubernetes installed
##
verify_that_kubectl_is_installed() {
    if ! command -v kubectl > /dev/null; then
      echo "Not found."
      echo "======================================================================================================"
      echo " Please install kubectl https://kubernetes.io/docs/tasks/tools/ and ensure that it is on your path."
      echo ""
      echo " Restart after installing kubectl."
      echo "======================================================================================================"
      echo ""
      exit 1
    fi
}

main() {
  verify_that_kubectl_is_installed

  set -e
  set -o pipefail

  trap 'rm -rf "$TMPDIR"' EXIT
  TMPDIR=$(mktemp -d)|| exit 1

  cd $TMPDIR

  if [[ "$OSTYPE" =~ ^linux ]]; then
    curl -sL https://github.com/armory/spinnaker-tools/releases/download/0.0.7/spinnaker-tools-linux -o spinnaker-tools
  else
    curl -sL https://github.com/armory/spinnaker-tools/releases/download/0.0.7/spinnaker-tools-darwin -o spinnaker-tools
  fi

  chmod a+x spinnaker-tools

  ./spinnaker-tools create-service-account -n quick-spin-sa -o ~/.kube/quick-spin.kubeconfig -s quick-spin-service-account

}

main "$@"