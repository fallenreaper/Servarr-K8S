# Servarr-K8S

[Servarr](https://wiki.servarr.com/) is a stack which enables index management and acquisition of media through torrents, usenet, or both and keeps a clean and organized download system.

## What will you get out of this?

You will have a means in which to run your own Servarr Stack. This will enable you to setup and manage your tools accordingly.

## Purpose

I wanted to give a better shot at both working at it through kubernetes and expanding the use case of my nodes. I wanted to find a better way to manage media acquisition by offloading the hunt for content to other tools.

## Coming Days

I have time to write up this documentation, based on what I need to accomplish. Some of the hardest things was honestly properly setting up my nas, because I accidently deleted all of its content, had to reformat it to work with correct OS, and enable one of my Raspberry Pi to act as the NAS, connected the SSD.

## Task List

- Make sure you have kubernetes set up with whatever number of nodes you need.
  - I am using a 5 Raspberry Pi setup, with a 2 TB SSD attached to worker-1
  - If you want to, you can use ansible to configure all the nodes by using something like [Jeff Geerling's Cluster Setup](https://github.com/geerlingguy/pi-cluster) to set things up. This will require you to learn and understand some ansible, specifically inventory files and ssh.
- ensure k8s is installed on your host machine so you can setup a connection to your master node as the default for your cluster. Otherwise you need to store Git Repos on Master to run scripts from there.
- Get a copy of [K8S MediaServer](https://github.com/kubealex/k8s-mediaserver-operator) which will be a base layer
- Understand your storage mechanism. You may be running a NAS, SMB, or Ceph/Rook to manage your data.
  - I will have a how-to on my storage set up

## TODO List

[x] Write up a how-to for setting up a NAS
[ ] Write up a how-to for running your base operator and media layer
[ ] Setting up Usenet server.
[ ] Setup for each \*Arr.

- [ ] sabnzbd
- [ ] Byparr
- [ ] Prowlarr
- [ ] Transmission
- [ ] Radarr
- [ ] Sonarr
