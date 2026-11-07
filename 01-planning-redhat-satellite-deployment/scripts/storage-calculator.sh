#!/bin/bash

echo "SATELLITE STORAGE CALCULATOR"
echo "============================"

# Base system requirements
BASE_STORAGE=50
MONGODB_BASE=20
LOGS=10

echo "Enter the number of RHEL repositories you plan to sync:"
read RHEL_REPOS

echo "Enter the number of third-party repositories:"
read THIRD_PARTY_REPOS

echo "Enter estimated number of managed hosts:"
read MANAGED_HOSTS

# Calculate storage needs
RHEL_STORAGE=$((RHEL_REPOS * 15))  # ~15GB per RHEL repo
THIRD_PARTY_STORAGE=$((THIRD_PARTY_REPOS * 5))  # ~5GB per third-party repo
HOST_OVERHEAD=$((MANAGED_HOSTS / 100))  # 1GB per 100 hosts for metadata

TOTAL_CONTENT=$((RHEL_STORAGE + THIRD_PARTY_STORAGE))
TOTAL_STORAGE=$((BASE_STORAGE + TOTAL_CONTENT + MONGODB_BASE + LOGS + HOST_OVERHEAD))

echo ""
echo "STORAGE CALCULATION RESULTS:"
echo "Base system storage: ${BASE_STORAGE} GB"
echo "RHEL repositories: ${RHEL_STORAGE} GB"
echo "Third-party repositories: ${THIRD_PARTY_STORAGE} GB"
echo "MongoDB storage: ${MONGODB_BASE} GB"
echo "Log storage: ${LOGS} GB"
echo "Host metadata overhead: ${HOST_OVERHEAD} GB"
echo "--------------------------------"
echo "TOTAL ESTIMATED STORAGE: ${TOTAL_STORAGE} GB"
echo "RECOMMENDED STORAGE: $((TOTAL_STORAGE + TOTAL_STORAGE/2)) GB (with 50% buffer)"
