#!/bin/bash

# Set values for your storage account
subscription_id="7f7931f7-3855-4c61-a115-14d8ecb1c41d"
azure_storage_account="aisearchstore2"
azure_storage_key="1ey5eKdfBBDJV2KMkpbfkdWU8rDZ1XiYjZDtU+O3TxetKKJlJmK4DfMDrfUe7t0+Mg/spjsFzyjq+AStppfiYw=="

echo "Creating container..."
az storage container create \
  --account-name "$azure_storage_account" \
  --subscription "$subscription_id" \
  --name margies \
  --auth-mode key \
  --account-key "$azure_storage_key" \
  --output none

echo "Uploading files..."
az storage blob upload-batch \
  -d margies \
  -s data \
  --account-name "$azure_storage_account" \
  --auth-mode key \
  --account-key "$azure_storage_key" \
  --output none
