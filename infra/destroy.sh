#!/usr/bin/env bash
set -euo pipefail

ENV=${1:-dev}
STACK_NAME="atlas-${ENV}-root"

echo "Deleting stack ${STACK_NAME}..."
aws cloudformation delete-stack --stack-name "${STACK_NAME}"

echo "Waiting for ${STACK_NAME} to be deleted..."
aws cloudformation wait stack-delete-complete --stack-name "${STACK_NAME}"

echo "Done."
