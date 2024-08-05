#!/bin/bash
mkdir -p $HOME/.config/qBittorrent

echo "[BitTorrent]
Session\Interface=tun0
Session\InterfaceName=tun0
Session\Port=58442

[LegalNotice]
Accepted=true" > $HOME/.config/qBittorrent/qBittorrent.conf
