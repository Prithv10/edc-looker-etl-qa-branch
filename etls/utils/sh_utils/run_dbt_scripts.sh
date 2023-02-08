#!/bin/bash


mode=$1
current_dir=$2
#current_dir=/mnt/c/Senthil_Repo/SquareShift/Edcast/OnWorks/GCP/domo_migrate/git_projects/edc-looker/
full_refresh=$3
org_id=$4
#dbt_target=$3


cd $current_dir || return
output=`python ./etls/utils/py_utils/bq_custom_fields_check.py "$org_id"`
echo "is custom fields available : " $output

dbt_select_std_only=standard_reports
dbt_exclude_models=standard_reports.custom_fields
dbt_vars="{var_cust_id: $org_id}"
project_dir=./etls
profiles_dir=./etls/profiles/docker
is_custom_fields_available=$output

if [ $mode = "run" ]; then
    echo "dbt Mode is run"
    if [ $is_custom_fields_available = "True" ]; then
      echo "Custom Fields available"
      if [ $full_refresh = "True" ]; then
          echo "Doing a full refresh"
          dbt run --project-dir=$project_dir --profiles-dir=$profiles_dir --select="$dbt_select_std_only" --vars="$dbt_vars" --full-refresh
      else
          echo "Doing an incremental run"
          dbt run --project-dir=$project_dir --profiles-dir=$profiles_dir --select="$dbt_select_std_only" --vars="$dbt_vars"
      fi
    else
      echo "Custom Fields not available"
      if [ $full_refresh = "True" ]; then
          echo "Doing a full refresh"
          dbt run --project-dir=$project_dir --profiles-dir=$profiles_dir --select="$dbt_select_std_only" --vars="$dbt_vars" --exclude=$dbt_exclude_models --full-refresh
      else
          echo "Doing an incremental run"
          dbt run --project-dir=$project_dir --profiles-dir=$profiles_dir --select="$dbt_select_std_only" --vars="$dbt_vars" --exclude=$dbt_exclude_models
      fi
    fi
elif [ $mode = "debug" ]; then
    echo "dbt Mode is debug"
    dbt debug --profiles-dir=$profiles_dir --project-dir=$project_dir
else
    echo "Incorrect dbt Mode. Nothing to do"
fi

# capture the exit code from the dbt run command
# so that the final exit code form removing virtualenv cmd doesn't get used by KubernetesPodOperator
exit_code=$?

# rethrowing the exit code to KubernetesPodOperator
exit $exit_code
