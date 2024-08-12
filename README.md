# Ubuntu Desktop 24.04 LTS with VNC Access

This repository contains a Docker setup for running an Ubuntu Desktop 24.04 LTS environment with VNC access. The container allows for a persistent home directory and customizable startup scripts.

## Features

- Ubuntu 24.04 LTS
- XFCE Desktop Environment
- VNC Server for remote access
- Persistent home directory
- Customizable startup scripts via environment variables

## Prerequisites

- Docker installed on your host machine

## Running the Docker Container

To run the container, use the following command. Replace the placeholder values with your desired username, password, and local directory for persistence.

```bash
docker run -d -p 5900:5900 \
    -e USER=myuser \
    -e PASSWORD=mypassword \
    -e CUSTOM_STARTUP_SCRIPT="apt-get update && apt-get install -y vim" \
    -v /path/to/local/directory:/home/myuser \
    --name ubuntu-vnc calebsargeant/ubuntu-desktop-vnc
```

## Environment Variables

- USER: The username for the new user (default: user)
- PASSWORD: The password for the new user (default: password)
- CUSTOM_STARTUP_SCRIPT: Custom commands to run on container startup (default: "")

## Volume Mapping

- /path/to/local/directory: The local directory mapped to the user’s home directory in the container for persistence.

## Accessing the Desktop Environment

1. Use a VNC client to connect to the container.
2.	Connect to localhost:5900.
3.	Use the VNC password set during the container startup (PASSWORD).

## Notes

- Ensure the local directory specified for volume mapping exists.
- The custom startup script can be used to install additional software or perform other setup tasks each time the container starts.

## License

This project is licensed under the MIT License. See the LICENSE file for details.