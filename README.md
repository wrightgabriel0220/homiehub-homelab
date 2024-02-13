# Homiehub Homelab
TODO: LOOK INTO ADDING BADGES HERE
## What is the Homiehub Homelab?
The Homiehub Homelab is a personal project of mine I took on to learn some new skills and hopefully provide myself and my friends with
some really cool free, open-source services that we can control democratically and use to share knowledge, resources, and communicate. The selection
of services I've put together here is targeted towards stability, convenience, and cross-platform compatibility as my users have 
very high platform stability demands and are mostly very non-technical. Feel free to use the code here to host your own homelab or just take a look
around at the code!

## Features
- Jellyfin Media Server
    * Movies, TV Shows, and Music
    * Media Requests
    * Automated Media Request Downloads
    * Feature-Rich Library Management
- Obsidian.md Digital Garden
- Feature-Rich Organizr Dashboard
    * Role-Based Permissioning
    * Unified Entrypoint for all Services
    * Weather Display
    * Quick and Easy IFrame Navigation w/ Compatible Services
- Portainer.io Container Management Server
- nginx Reverse Proxy
    * SSL Wildcard Certification
- ddclient DDNS

## Self-Hosting for Development
It is recommended to use VSCode to develop on the Homiehub Homelab to take full advantage of the VSCode Workspace features configured within.

From the root directory of the app, run `bash ./start_dev_server.sh`. The data and service config the app is running on is currently directly based on what is
inside of the `data` and `services` folders respectively and, thus, is dependent on the host device. Test data and testing configuration files should be generated and managed manually by simply running the dev server and then configuring each application from its respective admin/initialization portal. Refer to
each service's documentation for further information.
NOTE: All of your configurations and data will be locally stored in your repo. If you delete the whole repo at any point, you will have to reconfigure all your
services and lose things like user data, media, etc...

## Self-Hosting for Personal Deployment
### Prerequisites
TODO: EXPLAIN HERE HOW TO DEPLOY AT A DIFFERENT DOMAIN, DIFFERENT HOST, ETC...

## [Official Deployment](https://publish.obsidian.md/hb-homelab/Admin/Guides/Deployment)

## [Services](https://publish.obsidian.md/hb-homelab/Admin/Services)

## License
[The Unlicense](https://github.com/wrightgabriel0220/homiehub-homelab/UNLICENSE.txt)