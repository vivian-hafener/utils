#!/bin/bash
# Watcher uninstalls and reinstalls the Slurm Helm chart when it's values file changes

export KUBECONFIG=/home/vhafener/.kube/config


helm uninstall --namespace=slurm slurm
kubectl delete pvc -n slurm --all
#kubectl delete crd clusters.slinky.slurm.net
#kubectl delete crd nodesets.slinky.slurm.net
helm install slurm /home/vhafener/repos/slinky-dev/slurm-operator/helm/slurm --version=0.3.1 --values=/home/vhafener/repos/slinky-dev/slurm-operator/helm/slurm/values.yaml --namespace=slurm
