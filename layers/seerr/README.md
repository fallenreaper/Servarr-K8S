# Seer

The implementation of Seer is meant as a means to combine both of the respective Sonarr and Radarr into 1 search mechanism.

Another key aspect of this is that Jellyfin useraccounts can also access this to put in requests.

## Install

Seer seems to be primarily setup with Helm. It is essentially a package manager for Kubernetes, to ship deployments for users to consume.

You will need to have an underlying [values.yml](seerr.yml) which you can edit to configure. This is pulled from the [Seer Website](https://github.com/seerr-team/seerr/blob/develop/charts/seerr-chart/README.md)

```bash
helm install seerr oci://ghcr.io/seerr-team/seerr/seerr-chart -f seerr.yml
```

Upgrade, though this will also install if not previously installed:

```bash
helm upgrade --install seerr oci://ghcr.io/seerr-team/seerr/seerr-chart -f seerr.yml -n default --atomic --timeout 5m
```

## Setup

For my personal machine, I wanted to add it to my /etc/hosts for the host to stick since i am not trying to account for something like PiHole currently.

### Establishing connections

#### Prerequisites

You need to have Radarr and Sonarr installed and configured

#### First time going to site

You will want to log in. The issues you need to do is find the correct IP addresses for things. The connection to Seer was related to the Pod IP. It did not like the ingress oddhand. However you may be able to get that to work

When syncing to Radarr, I used the Pod IP so it got the connection set up. If the Pod crashes the IP can very well change. So this needs to be better managed, likely by referencing through ingress or hostname that k8s recognizes. I need to look more into it.
