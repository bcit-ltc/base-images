#!/bin/bash
set -euo pipefail
OUTPUT=$(semantic-release "$@" || true)
echo "$OUTPUT"
if echo "$OUTPUT" | grep -q 'Published release'; then
  echo "IS_RELEASE=true"
  VERSION=$(echo "$OUTPUT" | grep -oP 'Published release \K[0-9]+\.[0-9]+\.[0-9]+')
  echo "RELEASE_VERSION=$VERSION"
else
  echo "IS_RELEASE=false"
  echo "RELEASE_VERSION="
fi
