import subprocess

def call_dbt_by_org_ids(dbt_path,arr):
    for i in range(0, len(arr)):
        print("Execution No. ",i)
        print("********* START DBT SCRIPTS FOR ORG ID - ",arr[i])
        select_cmd = 'standard_reports.searches'
        cmd = dbt_path+'dbt run  --full-refresh --vars \"var_cust_id: \''+arr[i]+'\'\" --select '+select_cmd
        exit_code = subprocess.call(cmd)
        print("********* COMPLETED DBT SCRIPTS FOR ORG ID - ",arr[i])
        print("Execution Successful - ",exit_code)
        print("----------------\n\n")

def call_dbt_by_org_ids_linux(dbt_path,orgid_param):
    dbt_profile_path = '/home/senthil245/dbt_profiles'
    dbt_project_path = '/mnt/c/Senthil_Repo/SquareShift/Edcast/OnWorks/GCP/domo_migrate/git_projects/edc-looker/etls'
    dbt_install_path_linux =  '/home/senthil245/dbt-venv/bin/'
    dbt_install_path_win = '/mnt/c/Senthil_Repo/SquareShift/Edcast/OnWorks/GCP/domo_migrate/git_projects/concord-transforms/etls/venv/Scripts/'
    dbt_run_path = 'cd '+ dbt_project_path + ' && '+ dbt_install_path_linux
    print("********* START DBT SCRIPTS FOR ORG ID - ",orgid_param)
    select_cmd = 'standard_reports.searches'
    cmd = dbt_install_path_linux+'dbt run --profiles-dir '+ dbt_profile_path +' --full-refresh --vars "var_cust_id: '+orgid_param+'" --select '+select_cmd
    print("Command to execute : ",cmd)
    exit_code = subprocess.Popen(cmd, cwd=dbt_project_path)
    #exit_code = subprocess.call(cmd)
    print("********* COMPLETED DBT SCRIPTS FOR ORG ID - ",orgid_param)
    print("Execution Successful - ",exit_code)
    print("----------------\n\n")

dbt_path = 'C:\\Senthil_Repo\\SquareShift\\Edcast\\OnWorks\\GCP\\domo_migrate\\git_projects\\concord-transforms\\etls\\venv\\Scripts\\'
arr = ['7049']
call_dbt_by_org_ids(dbt_path,arr)
call_dbt_by_org_ids_linux(dbt_path,arr)