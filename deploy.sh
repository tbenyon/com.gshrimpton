#!/usr/bin/env bash

if [ -z ${ENV+x} ]; then
    echo "Warning: ENV not set. Defaulting to dev environment"
    ENV="dev"
fi

if [ -z ${CONF+x} ]; then
    echo "Warning: CONF not set. Defaulting to dev configuration"
    CONF="dev"
fi

if [ $ENV == "dev" ]; then
    TERRAFORM_ENV="default"
elif [ $ENV == "prod" ]; then
    TERRAFORM_ENV="prod"
else
    echo "Error: Unknown ENV value: '$ENV'"
    exit 1
fi

if [ $CONF != "dev" ] && [ $CONF != "prod" ]; then
    echo "Error: Unsupported CONF value '$CONF'"
    exit 2
fi

terraform env select $TERRAFORM_ENV
terraform apply -var "configuration=$CONF"