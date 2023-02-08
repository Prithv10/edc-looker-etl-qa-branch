# importing the required libraries
from datetime import timedelta, datetime
from airflow import DAG
from utils.deploy_utils.airflow.run_on_cluster.workouts import airflow_dbt_tasks

dag_id = "dbt_service_airflow_run_orglist_1"
def get_dag():
    default_args = {
        'owner': 'senthil',
        'depends_on_past': False,
        'start_date': datetime(2022,12,1),
        'email': ['senthil.kumar@edcast.com'],
        'email_on_failure': False,
        'email_on_retry': False,
        'retries': 1,
        'retry_delay': timedelta(minutes=1)
    }

    # define the DAG
    dag = DAG(
        dag_id,
        default_args=default_args,
        description='Airflow run by Org IDs',
        schedule_interval=timedelta(hours=24), # run every hour
        catchup=False # do not perform a backfill of missing runs
    )
    return dag

def create_dag(obj,dbt_run_type,dag,org_list):
    if dbt_run_type is 'full-refresh' or 'full_refresh':
        obj.run_dbt_full_refresh(dag, org_list)
    elif dbt_run_type is 'incremental':
        obj.run_dbt_incremental(dag, org_list)
    else:
        print("The dbt_run_type variable inputs are incorrect. "
              "Please correct and run again")

# Main dag function starts

# TODO : Change to environment variables

# dbt_run_type values - full_refresh/full-refresh or incremental
dbt_run_type = 'full-refresh'

#org_list - provide input of string array as Org Ids - sample : ['222', '366', '373']
org_list = ['222', '366', '373', '432', '436', '470', '473', '531', '538']

"""
# org_list - provide input of string array as Org Ids - sample : ['222', '366', '373']
org_list_0 = ['222', '366', '373', '432', '436', '470', '473', '531', '538']
org_list_1 = ['470', '473', '531', '538']
org_list_2 = ['222', '366', '373', ]
"""


obj = airflow_dbt_tasks.airflow_dbt_tasks()
dag = get_dag()
globals()[dag_id] = create_dag(obj,dbt_run_type,dag,org_list)