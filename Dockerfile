# Use Ubuntu 24.04 LTS as the base image
FROM ubuntu:24.04

# Install necessary packages
RUN apt-get update && apt-get install -y \
    xfce4 \
    xfce4-goodies \
    x11vnc \
    xvfb \
    dbus-x11 \
    xterm \
    sudo \
    wget \
    && apt-get clean

# Set the environment to use UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Set default environment variables for user and password
ENV USER=admin
ENV PASSWORD=password
ENV CUSTOM_STARTUP_SCRIPT=""

# Copy the startup script
COPY startup.sh /usr/local/bin/startup.sh
RUN chmod +x /usr/local/bin/startup.sh

# Set the entrypoint script
ENTRYPOINT ["/usr/local/bin/startup.sh"]

# Expose the VNC port
EXPOSE 5900