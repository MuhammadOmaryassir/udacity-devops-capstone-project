#!/usr/bin/env bash

aws cloudformation create-stack --stack-name capstone2 --template-body file://./aws/capstone_infra.yml \
--parameters file://./aws/capstone_infra_parameter.json 

