#!/usr/bin/env bash

TERRAFORM_ENV="default"

if [ -z ${STAGE+x} ]; then
    echo "Warning: STAGE not set. Defaulting to dev environment"
elif [ $STAGE == "prod" ]; then
    TERRAFORM_ENV="prod"
fi

terraform env select $TERRAFORM_ENV
terraform apply