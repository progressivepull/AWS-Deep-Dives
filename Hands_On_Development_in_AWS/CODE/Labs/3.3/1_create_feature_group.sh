#!/bin/bash
echo '>>> aws sagemaker create-feature-group --cli-input-json file://feature_group_create_cli.json'
aws sagemaker create-feature-group --cli-input-json file://feature_group_create_cli.json
echo
echo


echo '>>> aws sagemaker describe-feature-group --feature-group-name "HomeSales"'
aws sagemaker describe-feature-group --feature-group-name "HomeSales"
echo
echo
