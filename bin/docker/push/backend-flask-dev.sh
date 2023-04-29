#!/bin/bash
set -e

if [[ -z "${ECR_BACKEND_FLASK_URL}" ]]; then
  ECR_BACKEND_FLASK_URL="$AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/backend-flask"
fi

echo $ECR_BACKEND_FLASK_URL

docker tag backend-flask:dev $ECR_BACKEND_FLASK_URL:dev

docker push $ECR_BACKEND_FLASK_URL:dev
