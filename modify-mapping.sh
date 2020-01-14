#!/usr/bin/env bash

curl -X DELETE http://localhost:6060/__admin/mappings
curl -X POST \
    --data "@update-mapping.json" \
    http://localhost:6060/__admin/mappings/new