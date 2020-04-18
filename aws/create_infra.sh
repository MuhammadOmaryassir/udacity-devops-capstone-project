#!/usr/bin/env bash

UUID="$(uuidgen)"

aws cloudformation create-stack --stack-name capstoneudacity$UUID --template-body file://./aws/capstone_infra.yml \
--parameters file://./aws/capstone_infra_parameter.json --region=us-west-2

