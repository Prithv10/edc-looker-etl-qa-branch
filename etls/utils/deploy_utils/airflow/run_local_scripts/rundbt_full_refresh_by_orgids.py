
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
    'rundbt_full_refresh_by_orgids',
    default_args=default_args,
    concurrency=4,
    max_active_runs=3,
    description='Run DBT Incremental Jobs for multiple organizations',
    schedule_interval=timedelta(hours=1), # run every hour
    catchup=False # do not perform a backfill of missing runs
)


# define python function for PythonOperator
def get_bashcmd_by_org_id(orgid_param):
    ## DBT Related Variables
    dbt_install_path_linux = '/home/senthil245/dbt-venv/bin/'
    dbt_install_path_linux = ''

    # 1.0) copy dags from git path to airflow path
    # $cp /mnt/c/Senthil_Repo/SquareShift/Edcast/OnWorks/GCP/domo_migrate/git_projects/edc-looker/etls/deploy_utils/airflow/*.py /home/senthil245/airflow/dags

    # 1.1) dbt run command
    dbt_profile_path = '/home/senthil245/dbt_profiles'
    select_cmd = 'standard_reports.searches'
    dbt_run_cmd = 'dbt run --profiles-dir '+ dbt_profile_path +' --full-refresh --vars "var_cust_id: '+orgid_param+'" --select '+select_cmd

    # 1.2) dbt source folder path with change directory
    dbt_project_path = '/mnt/c/Senthil_Repo/SquareShift/Edcast/OnWorks/GCP/domo_migrate/git_projects/edc-looker/etls'
    dbt_cd_run_path = 'cd ' + dbt_project_path

    # 1.3) python env activate with 1.2 Step
    env_linux_path = 'source /home/senthil245/dbt-venv/bin/activate && PYTHONPATH=/home/senthil245/dbt-venv/airflow/dags:$PYTHONPATH && '+dbt_cd_run_path

    print("********* START DBT SCRIPTS FOR ORG ID - ",orgid_param)

    # 1.4 ) combine 1.3 with 1.1
    cmd = env_linux_path+' && '+dbt_run_cmd
    print("Command to execute : ",cmd)
    #exit_code = subprocess.Popen(cmd, cwd=dbt_project_path)
    #exit_code = subprocess.call(cmd)
    #print("********* COMPLETED DBT SCRIPTS FOR ORG ID - ",orgid_param)
    #print("Execution Successful - ",exit_code)
    print("----------------\n\n")
    return cmd

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
    bsh_cmd = get_bashcmd_by_org_id(orgid)
    run_dbt_full_refresh_task = BashOperator(
        task_id='run_dbt_full_refresh_{}'.format(orgid),
        bash_command=bsh_cmd,
        email_on_failure=False,
        email='senthil.kumar@edcast.com',
        dag=dag
    )
    bash1_start >> run_dbt_full_refresh_task >> bash2_complete
