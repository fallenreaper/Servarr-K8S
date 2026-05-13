# Setting Up Storage

This will handle setting up a NAS or SMB.

## Ansible

Make sure your SSD is running and mounted to your directory of choice. Make sure it is added to /etc/fstab so that it will automount on reboot. The mounted location, is going to be the `mount_point` property in the setup-storage file. The User/Password are going to be the log in credentials for access. You can confirm it works because it will appear on your network.

### Tasks to Complete

- Enasure your ssd is properly set up so it can be used by Mac. I used exFAT as the ssd format.

- Ensure that the inventory file is properly set up.

- Execute the playbook `ansible-playbook -i inventory.yml setup-storage.yml`. This should properly setup the storage as a NAS for later use.

### Confirming it works

You should see it in your network tabs on your network. I confirmed that I can see it on linux, mac, and windows machines.

## K8S

The K8S files are used to create connections in K8S so it can be properly linked to. You will use a secrets file for credentials, then setup a storage class, service, volume and claim.
