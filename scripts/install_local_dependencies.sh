#!/bin/bash -eux

echo ""
echo "Will install local development dependencies (python)"
echo ""

# Install dependencies from poetry spec
(cd model && poetry install)
