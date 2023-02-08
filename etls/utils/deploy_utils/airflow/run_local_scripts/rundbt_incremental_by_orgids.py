
# importing the required libraries
from datetime import timedelta, datetime
from airflow import DAG
from airflow.operators.python_operator import PythonOperator
from airflow.operators.bash_operator import BashOperator
import subprocess

# These args will get passed on to the python operator
default_args = {
    'owner': 'senthil',
    'depends_on_past': False,
    'start_date': datetime(2021,10,11),
    'email': ['senthil.kumar@edcast.com'],
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=2)
}

# define the DAG
dag = DAG(
    'rundbt_incremental_by_orgids',
    default_args=default_args,
    description='Run DBT Incremental Jobs for multiple organizations',
    schedule_interval=timedelta(hours=1), # run every hour
    catchup=False # do not perform a backfill of missing runs
)


# define python function for PythonOperator
def call_dbt_by_org_ids(orgid_param,**kwargs):
    dbt_path = '/mnt/c/Senthil_Repo/SquareShift/Edcast/OnWorks/GCP/domo_migrate/git_projects/concord-transforms/etls/venv/Scripts/'
    print("********* START DBT SCRIPTS FOR ORG ID - ",orgid_param)
    select_cmd = 'standard_reports.searches'
    cmd = dbt_path+'dbt run --vars \"var_cust_id: \''+orgid_param+'\'\" --select '+select_cmd
    exit_code = subprocess.call(cmd)
    print("********* COMPLETED DBT SCRIPTS FOR ORG ID - ",orgid_param)
    print("Execution Successful - ",exit_code)
    print("----------------\n\n")


# define steps
bash1_start = BashOperator(
    task_id='start',
    bash_command='echo "The Airflow job has started "',
    dag=dag
)

bash2_complete = BashOperator(
    task_id='complete',
    bash_command='echo "The Airflow job has completed"',
    dag=dag
)

org_list = ['222', '366','373','432','436','470','473','531','538']
for orgid in org_list:
    run_dbt_incr_task = PythonOperator(
        task_id='run_dbt_incr_{}'.format(orgid),
        python_callable=call_dbt_by_org_ids,
        email_on_failure=False,
        email='senthil.kumar@edcast.com',
        op_kwargs={'orgid_param': orgid},
        dag=dag,
        task_concurrency=4
    )
    bash1_start >> run_dbt_incr_task >> bash2_complete
