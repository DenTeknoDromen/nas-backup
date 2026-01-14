#!/bin/bash

apt-get update && apt upgrade
apt install samba

mv /etc/samba/smb.conf /etc/samba/original.smb.conf
cp ./*.conf /etc/samba/

groupadd --system smbgroup
useradd --system --no-create-home --group smbgroup -s /bin/false smbuser

mkdir /backup
chown -R smbuser:smbgroup /backup
chmod -R 775 /backup

systemctl restart smbd
systemctl status smbd

echo "Script completed"

