## Delet existing resource

aws ecr delete-repository \
 --repository-name atlas-dev-auth-service \
 --force

## inspect the resources

aws cloudformation describe-stack-events \
 --stack-name atlas-dev-root \
 --no-cli-pager \
 --query "StackEvents[?ResourceStatus=='DELETE_FAILED'].[LogicalResourceId,ResourceType,ResourceStatusReason]" \
 --output table
