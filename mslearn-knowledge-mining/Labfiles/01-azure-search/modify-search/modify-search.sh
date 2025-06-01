#!/bin/bash

# Set values for your Search service
url=""
admin_key=""

#!/bin/bash

# Quick fix version - minimal changes to your existing script

echo "-----"
echo "Stopping indexer first..."
curl -X POST "${url}/indexers/margies-indexer/stop?api-version=2023-11-01" \
  -H "api-key: ${admin_key}"

sleep 3

echo "-----"  
echo "Updating the skillset..."
curl -X PUT "${url}/skillsets/margies-skillset?api-version=2023-11-01" \
  -H "Content-Type: application/json" \
  -H "api-key: ${admin_key}" \
  -d @skillset.json

sleep 2

echo "-----"
echo "Deleting existing index (to avoid field modification errors)..."
curl -X DELETE "${url}/indexes/margies-index?api-version=2023-11-01" \
  -H "api-key: ${admin_key}"

sleep 2

echo "-----"
echo "Creating new index..."
curl -X POST "${url}/indexes?api-version=2023-11-01" \
  -H "Content-Type: application/json" \
  -H "api-key: ${admin_key}" \
  -d @index.json

sleep 2

echo "-----"
echo "Updating the indexer..."
curl -X PUT "${url}/indexers/margies-indexer?api-version=2023-11-01" \
  -H "Content-Type: application/json" \
  -H "api-key: ${admin_key}" \
  -d @indexer.json

echo "-----"
echo "Resetting the indexer..."
curl -X POST "${url}/indexers/margies-indexer/reset?api-version=2023-11-01" \
  -H "Content-Type: application/json" \
  -H "Content-Length: 0" \
  -H "api-key: ${admin_key}"

sleep 5

echo "-----"
echo "Running the indexer..."
curl -X POST "${url}/indexers/margies-indexer/run?api-version=2023-11-01" \
  -H "Content-Type: application/json" \
  -H "Content-Length: 0" \
  -H "api-key: ${admin_key}"

echo "-----"
echo "Done! Check indexer status in the portal."
