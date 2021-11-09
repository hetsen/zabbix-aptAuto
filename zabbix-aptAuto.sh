#!/bin/bash

echo 'Cloning zabbix-apt'
git clone https://github.com/theranger/zabbix-apt
echo 'Copying 02peridic to /etc/apt/apt.conf.d/'
cp zabbix-apt/apt.conf.d/02periodic /etc/apt/apt.conf.d/
echo 'Copying apt.conf to /etc/zabbix/zabbix_agentd.d/'
cp zabbix-apt/zabbix_agentd.d/apt.conf /etc/zabbix/zabbix_agentd.d/
echo 'Adding Timeout=30 to /etc/zabbix/zabbix/agentd.conf'
sed -i 's/# Timeout=3/Timeout=30/' /etc/zabbix/zabbix_agentd.conf
echo 'Restarting zabbix-agent'
service zabbix-agent restart
echo 'Should be all done now'
