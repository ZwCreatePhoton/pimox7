#!/bin/bash

echo "[+] Disabling VLAN"
sed -i 's/^\(\s*\)bridge\-v/#\1bridge\-v/g' /etc/network/interfaces
systemctl restart networking

sleep 10
ip -f inet addr show vmbr0 | grep inet > /dev/null
if [ $? = 1 ]; then
  echo "[!] Failed to acquire an IP address for vmbr0"
  exit 1
else
  echo "[+] Accuired an IP address for vmbr0"
fi

echo "[+] Enabling VLAN"
sed -i 's/^#\(\s*\)bridge\-v/\1bridge\-v/g' /etc/network/interfaces
systemctl restart networking

echo "[+] Waiting to acquire an IP address for vmbr0"
end=$((SECONDS+10))
while [ $SECONDS -lt $end ]; do
  sleep 1
  ip -f inet addr show vmbr0 | grep inet > /dev/null
  if [ $? = 0 ]; then
    break
  fi
done
ip -f inet addr show vmbr0 | grep inet > /dev/null
if [ $? = 1 ]; then
  echo "[!] Failed to acquire an IP address for vmbr0"
  exit 1
else
  echo "[+] Accuired an IP address for vmbr0"
fi

echo "[+] Success"
exit 0
