# Setting Up Storage

This will handle setting up a NAS or SMB.

## Ansible

Make sure your SSD is running and mounted to your directory of choice. Make sure it is added to /etc/fstab so that it will automount on reboot. The mounted location, is going to be the `mount_point` property in the setup-storage file. The User/Password are going to be the log in credentials for access. You can confirm it works because it will appear on your network.

### Tasks to Complete

- Ensure your ssd is properly set up so it can be used by Mac. I used exFAT as the ssd format.

- Ensure that the inventory file is properly set up.

- Execute the playbook `ansible-playbook -i inventory.yml setup-storage.yml`. This should properly setup the storage as a NAS for later use.

### Confirming it works

You should see it in your network tabs on your network. I confirmed that I can see it on linux, mac, and windows machines.

## K8S

The K8S files are used to create connections in K8S so it can be properly linked to. You will use a secrets file for credentials, then setup a storage class, service, volume and claim.

Each of the Pfiles in the [k8s](../storage/k8s/) contains the scripts that will create your storage volume in the cluster.

You will see that the SAMBA USER and SAMBA PASSWORD are goingt o be used in your secrets.yml file.

This will enable that your secrets are properly set for all the pods to make use of.

I like to run things in order cause it makes sense to me.

```bash
alias k=kubectl
k apply -f storage-class.yml service.yml secrets.yml
k apply -f pv.yml
```

The Persistent volume ( pv ) sets up the NAS. It references uses the secrets, the Address location, mounted options, retension, and storage size.

You see it references the storage-class object. SO it is a pv that is a part of that storage class.

Now you just need to reference that storage class and it will create claims as needed.
