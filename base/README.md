# Baseline K8S

This is a baseline k8s install before we add additional layers.

## Setup

clone [k8s-mediaserver-operator](https://github.com/kubealex/k8s-mediaserver-operator)

```bash
git clone https://github.com/kubealex/k8s-mediaserver-operator
```

Before you run these scripts, you will want to make sure your Storage is setup correctly. For help with that, before continuing, go to [Storage](../storage/README.md).

Determine how you will manage your system. Will You run kubectl from a host machine, or run scripts from within your master node. All the commands will be using `kubectl` either way, but just keep in mind that you may need to set your config to point to your cluster.

## Tasks

### Test Run

Just see what happens. From within your k8s-mediaserver-operator, you can do a quick test to see how things work. To do that, you will call 2 files in sequence

```bash
kubectl apply -f k8s-mediaserver-operator.yml
kubectl apply -f k8s-mediaserver.yml
```

The README from that repo has a lot of configuration options based on the deployment you are going to be looking at. For now, lets just manage with the defaults.

You can do an observation by running `kubectl events --watch` if you want to see what events is going on. You will likely see that it never becomes available because there needs to be shared storage where everything can be shared.

If you are going to NOT use a storage mechanism and just use local storage there are 2 things to be cognizant of. The first thing is that if you define local storage, it will exist in 1 location, and all places needing to reference it will need to be on the same node.

This is overcome by creating a NAS that all nodes in your cluster can access. This allows for a better distribution of pods across your cluster.

If you are running the cluster on 1 machine, doing a local volume that is 1-2T large is fine as it is a Single-Node cluster. However, if you have distribution and redundancy in place, a consolidated storage location is vital.

### Setting up your Persistent Volume

In the [storage](../storage/README.md) section you setup your nas AND you set up your references so you have a PV and a Storage Class referenced.

If you have not done this, then do it now.

In the GENERAL spec, you will want to update the general object's storage to point to the pvcStorageClass. You will give it a pvcName, ensure it has ReadWriteMany, and a size. The size is not as important overall.

You can reapply this and it will establish the claim and all of the pods will start to online.

`kubectl apply -f k8s-mediaserver.yml`
