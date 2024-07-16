#!/bin/bash

/usr/sbin/ifconfig tailscale0 up
/usr/bin/tailscale up --accept-routes
