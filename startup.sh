#!/bin/bash

# Create a user and set a password
useradd -m -s /bin/bash $USER && echo "$USER:$PASSWORD" | chpasswd

# Grant sudo privileges to the user
adduser $USER sudo

# Install VNC server and set a password
mkdir -p /home/$USER/.vnc \
    && x11vnc -storepasswd $PASSWORD /home/$USER/.vnc/passwd

# Start dbus
service dbus start

# Start Xvfb
Xvfb :1 -screen 0 1024x768x16 &

# Start the xfce4 session
export DISPLAY=:1
startxfce4 &

# Run custom startup script if provided
if [ -n "$CUSTOM_STARTUP_SCRIPT" ]; then
    echo "Running custom startup script: $CUSTOM_STARTUP_SCRIPT"
    /bin/bash -c "$CUSTOM_STARTUP_SCRIPT"
fi

# Start the VNC server
x11vnc -forever -usepw -create -display :1 &
wait