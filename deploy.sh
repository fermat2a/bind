#!/bin/bash

echo "dhcp1:" && \
scp * root@dhcp1:/etc/bind/ && \
ssh root@dhcp1 systemctl restart bind9 && \
echo "dhcp2:" && \
scp * root@dhcp2:/etc/bind/ && \
ssh root@dhcp2 systemctl restart bind9 && \
echo "drecksserver:" && \
scp * fermat@drecksserver:repositories/bind/ && \
ssh fermat@drecksserver docker container restart bind && \
echo "Successfully deployed and restarted DNS"

