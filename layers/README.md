# Folder Information

## Contents

- [Byparr](./byparr/README.md)
- [CloudFlare Tunnel](./cloudflared-tunnel/README.md)
- [Seerr](./seerr/README.md)

## Linking Seerr to Jellyfin

When Seerr is installed and linked to Jellyfin, it creates 2 seperate websites for clients to go to. The will interlink the same credentials.

### Jellyfin Enhanced

The Repo is located at [Jellyfin Enhanced](https://github.com/n00bcodr/Jellyfin-Enhanced) and will allow you to start the rapid setup of the ability to manage requests from within your Jellyfin ecosystem. This is something that enables users to query and put in requests for content.

You want to do this for 2 reasons:

- Gives your server the feeling of more Robust.
  - Instead of querying against what you have only, it will enable requests.
- Allows users to do all actions in 1 website instead of jumping around
- Keeps users updated when requested items are ready.

### TLDR

You will want to go to plugin part of the app and add the 2 repos for plugin management.

> https://raw.githubusercontent.com/n00bcodr/jellyfin-plugins/main/10.11/manifest.json
> https://www.iamparadox.dev/jellyfin/plugins/manifest.json

You will then want to make sure the manifests are pulled into the system.

- Scheduled Tasks
- Update Plugins
  - Run it.
- Wait 3 minutes then hard refresh your website.
- Return to Plugins
- Click Available.

Then after that you will need to install the following Plugins:

- File Transformation
- Jellyfin Enhanced

After they are both installed, you need to restart, so go to your dashboard and click restart. It will restart everything and ensure the installed plugins are booted.

#### Configuration

You will not need to add any Configuration to `File Transformation` however you will need to enable it for `Jellyfin Enhanced`

In the Seerr Tab, you will need do a few things

- Enable Seerr Integration [ YES ]
- Enter your Seerr url and api
  - If youre using k8s, use the ingress name.
- Show Seerr in Search [ YES ]
- Show Collections in Seerr Results [ YES ]
- Add Requested Media to Watchlist [ YES ]
- Sync Seerr Watchlist [ YES ]
- Auto Import Users to Seerr [ YES ]
- Conduct an Audit
  - Ensure Users are Compliant.
  - If out of compliance, log into Seerr and update user
- SAVE
  While this should work, I did 1 more restart to just confirm it all sticks.

Now when a user conducts a search through Jellyfin, it will pull all Seerr results as well to create more robustness and queue items.
