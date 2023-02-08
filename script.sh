#!/bin/sh

cd etls
dbt --version
dbt --version --profiles-dir .  # Pulls the most recent version of the dependencies listed in your packages.yml from git
dbt deps --profiles-dir .  # Pulls the most recent version of the dependencies listed in your packages.yml from git

echo dbt $1 --vars "var_cust_id: '$2'" --select $3
dbt $1 --vars "var_cust_id: '$2'" --select $3

