#!/usr/bin/env bash

aws s3api create-bucket --region eu-west-2 --bucket www.gshrimpton.com.terraform --create-bucket-configuration LocationConstraint=eu-west-2