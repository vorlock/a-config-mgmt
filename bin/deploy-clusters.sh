#!/bin/bash

for cname in aks eks gke; do
    export KUBECONFIG=${HOME}/work/kpmg/multicloud/${cname}-kubectl.conf
    #kubectl apply -f - <<EOF
    cat > /tmp/dupa.${cname} <<EOF
apiVersion: configmanagement.gke.io/v1
kind: ConfigManagement
metadata:
  name: config-management
spec:
  # clusterName is required and must be unique among all managed clusters
  clusterName: ${cname}-anthos-01
  git:
    syncRepo: https://github.com/vorlock/a-config-mgmt.git
    syncBranch: master
    secretType: none
EOF
done
