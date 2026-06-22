# Monitoring Your Stack

## Requirements

## Setup

WARNNING: Scraparr was having issues with associating information defined in values, and while there is outstanding tickets, I do NOT reccomend using this tool. I suggest using the tools towards the bottom of this readme, which is related to tooling in k8s/ folder.

```bash
helm repo add imgios https://imgios.github.io/scraparr
```

Afer adding this repo, you will need to run a standup command to get it working

```bash
helm install scraparr imgios/scraparr \
--namespace scraparr \
--create-namespace \
--values values.yml
```

Observing it standing up will be dont through the `scraparr` namespace.

```bash
kubectl --namespace scraparr get all
```

## Deploying an Arr exporter + Prometheus + Grafana

The repo includes example Kubernetes manifests under `k8s/` to create an `arr-exporter` namespace, an exporter deployment that can talk to Sonarr/Radarr/Prowlarr in the `default` namespace, a Prometheus instance to ingest the metrics, and a Grafana instance provisioned with Prometheus as a datasource.

Apply everything with:

```bash
# from the repository root
kubectl apply -f k8s/namespace.yaml
kubectl apply -f k8s/arr-exporter-deployment.yaml
kubectl apply -f k8s/exportarr-configmap.yaml -f k8s/exportarr-secrets.yaml
kubectl apply -f k8s/prometheus-configmap.yaml
kubectl apply -f k8s/prometheus-deployment.yaml
kubectl apply -f k8s/grafana-datasource-configmap.yaml
kubectl apply -f k8s/grafana-deployment.yaml
```

Deploys `exportarr` instances for Sonarr/Radarr/Prowlarr using `ghcr.io/onedr0p/exportarr:latest`. Each app needs its own exporter instance and API key.

A ConfigMap `k8s/exportarr-configmap.yaml` is provided for URL values. Create it from an env file like this:

```bash
kubectl create configmap exportarr-config \
  --namespace arr-exporter \
  --from-env-file=.env.local
```

Then create the API key secret from the same file:

```bash
kubectl create secret generic exportarr-secrets \
  --namespace arr-exporter \
  --from-env-file=.env.local
```

The deployments use `envFrom` to load URL values from the ConfigMap and `API_KEY` from the Secret.

Verify Prometheus is running:

```bash
kubectl --namespace arr-exporter get pods -l app=prometheus
kubectl --namespace arr-exporter get svc prometheus
# access Prometheus on any node at http://<node-ip>:30090
```

Verify Grafana and access the UI:

```bash
kubectl --namespace arr-exporter get pods -l app=grafana
kubectl --namespace arr-exporter get svc grafana
# access Grafana on any node at http://<node-ip>:30030
# default credentials are admin/admin
```
