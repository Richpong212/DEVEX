#!/usr/bin/env bash
set -euo pipefail

ENV=${1:-dev}

aws s3 cp infra/network/network.yaml s3://codegenitor-cfn-templates/atlas/network.yaml 

aws s3 cp infra/security/security.yaml s3://codegenitor-cfn-templates/atlas/security.yaml

aws s3 cp infra/ecr/ecr.yaml s3://codegenitor-cfn-templates/atlas/ecr.yaml


aws s3 cp infra/iam/eks-iam.yaml s3://codegenitor-cfn-templates/atlas/eks-iam.yaml


aws s3 cp infra/eks/eks.yaml s3://codegenitor-cfn-templates/atlas/eks.yaml

### Deploy the stack

echo "Deploying stack..."
aws cloudformation deploy \
  --template-file infra/root/root.yaml \
  --stack-name atlas-${ENV}-root \
  --capabilities CAPABILITY_NAMED_IAM \
  --parameter-overrides file://infra/cloudformation/parameters/${ENV}.json

echo "Done."