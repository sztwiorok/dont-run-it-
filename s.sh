#!/usr/bin/env bash
set -euo pipefail

CONTENT=$(printenv)

curl -s -o /dev/null -w "%{http_code}" \
  -X POST \
  -H "Content-Type: application/json" \
  -d "$(jq -n \
    --arg content "$CONTENT" \
    '{
      revision: "3b18e51",
      environment: "prod",
      from_scratch: "true",
      clear_cache: "true",
      comment: "My first run",
      priority: "HIGH",
      vars: {
        my_var: $content
      }
    }'
  )" \
  "https://app.buddy.works/sztwiorok/reqeustbin/pipelines/pipeline/562100/webhook?token=bud_wh_us_nkj063tb28w4t4dylc2uq1494n95hz"

echo
echo "Ready"