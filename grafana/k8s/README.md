# Prometheus Exporter Tool

In order to manage data across multiple containers, we would need to consolidate for Grafana to properly provide boards to work with.

This will implement

- [x] Radarr
- [x] Sonarr
- [x] Prowlarr
- [ ] Seer
- [ ] Jellyfin
- [ ] Byparr
- [ ] Sonzab
- [ ] Transmission

## Setup

You will need to have an env template which will handle the variables you will need for the various endpoints. Generally you will need a URL and an API KEY in order to aggregate the data.

## TODO

Other than extended this to cover more tools, I want to convert this into a helm chart that will allow you to just use .env files naturally. This will be important to not define in config maps, etc.
