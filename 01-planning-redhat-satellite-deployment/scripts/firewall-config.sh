#!/bin/bash

echo "SATELLITE FIREWALL CONFIGURATION"
echo "================================"

# This script shows the firewall rules needed for Satellite
# DO NOT RUN in production without review

echo "Required firewall rules for Satellite Server:"
echo ""

echo "# Allow HTTPS traffic"
echo "firewall-cmd --permanent --add-port=443/tcp"
echo ""

echo "# Allow HTTP traffic (redirects to HTTPS)"
echo "firewall-cmd --permanent --add-port=80/tcp"
echo ""

echo "# Allow Katello agent communication"
echo "firewall-cmd --permanent --add-port=5647/tcp"
echo ""

echo "# Allow Puppet agent communication"
echo "firewall-cmd --permanent --add-port=8140/tcp"
echo ""

echo "# Reload firewall configuration"
echo "firewall-cmd --reload"
echo ""

echo "For Capsule Servers, additional ports may be required:"
echo "# TFTP for PXE boot"
echo "firewall-cmd --permanent --add-port=69/udp"
echo ""

echo "# DNS service"
echo "firewall-cmd --permanent --add-port=53/tcp"
echo "firewall-cmd --permanent --add-port=53/udp"
echo ""

echo "# DHCP service"
echo "firewall-cmd --permanent --add-port=67/udp"
echo "firewall-cmd --permanent --add-port=68/udp"
