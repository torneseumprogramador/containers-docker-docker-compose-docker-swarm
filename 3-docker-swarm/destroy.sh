#!/bin/bash
cd 0-terraform
terraform destroy -auto-approve

cd ../rds-terraform
terraform destroy -auto-approve