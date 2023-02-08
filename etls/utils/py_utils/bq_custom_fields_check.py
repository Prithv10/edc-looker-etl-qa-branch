from google.cloud import bigquery
import os
from google.oauth2 import service_account
import sys

def get_bq_record_count(service_key_json_file_linux,dataset_name,table_name):

    credentials = service_account.Credentials.from_service_account_file(service_key_json_file_linux)
    client = bigquery.Client(credentials=credentials)
    bq_tbl_name = dataset_name+'.'+table_name
    QUERY = (
        'SELECT * FROM '+bq_tbl_name
        )
    query_job = client.query(QUERY)  # API request
    rows = query_job.result()  # Waits for query to finish
    is_custom_data_available = False
    if rows.total_rows > 0 :
        is_custom_data_available = True
    return is_custom_data_available

#service_key_json_file = os.environ.get('GOOGLE_APPLICATION_CREDENTIALS')
service_key_json_file_win = 'C:\Senthil_Repo\SquareShift\Edcast\OnWorks\GCP\\auth\qa_accounts\\aws-us-east-1-qa-01-c8535c4c48ae.json'
service_key_json_file_linux = '/dbt/etls/profiles/docker/json_key/aws-us-east-1-qa-01-c8535c4c48ae.json'
org_id = sys.argv[1]
dataset_name = 'edc_qa_analytics_customer_' + org_id
is_custom_data_avail_flag = get_bq_record_count(service_key_json_file_linux,dataset_name,'user_custom_fields_dim_m')
print(is_custom_data_avail_flag)