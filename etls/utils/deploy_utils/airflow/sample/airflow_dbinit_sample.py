# importing the required libraries
from datetime import timedelta, datetime
from airflow import DAG
from airflow.operators.python_operator import PythonOperator
from airflow.operators.bash_operator import BashOperator
from airflow.providers.cncf.kubernetes.operators.kubernetes_pod import KubernetesPodOperator

from kubernetes.client import models as k8s_models
from kubernetes.client import models as k8s


# These args will get passed on to the python operator
default_args = {
    'owner': 'senthil',
    'depends_on_past': False,
    'start_date': datetime(2022,12,1),
    'email': ['senthil.kumar@edcast.com'],
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=3)
}

# define the DAG
dag = DAG(
    'airflow_dbinit_sample',
    default_args=default_args,
    description='Getting Started with Airflow',
    schedule_interval=timedelta(hours=24), # run every hour
    catchup=False # do not perform a backfill of missing runs
)

# define python function for PythonOperator
def hello_world():
    print('Hello World')
    return 'This gets printed in the logs'

# define steps
python1= PythonOperator(
    task_id='python1',
    python_callable=hello_world,
    dag=dag
)

bash1 = BashOperator(
    task_id='bash1',
    bash_command='echo "BashOperator 1 on Airflow" ',
    dag=dag
)


bash2 = BashOperator(
    task_id='bash2',
    bash_command='echo "BashOperator 1 on Airflow" ',
    dag=dag
)

dbt_transformations = KubernetesPodOperator(
        task_id="dbt_transformations",
        name="dbt_transformations",
        namespace="db-init-sample-ns",
        image="us-central1-docker.pkg.dev/edconcorddawntest/edcast-dbt-poc-repo/dbt-init-sample:0.1.1",
        image_pull_secrets=[k8s.V1LocalObjectReference("myregistrykey")],
        dag=dag,
        # Entrypoint of the container, if not specified the Docker container's
        # entrypoint is used. The cmds parameter is templated.
        cmds=["dbt", "run"],
        # Arguments to the entrypoint. The docker image's CMD is used if this
        # is not provided. The arguments parameter is templated.
        arguments=[
            "--project-dir", "./etls", "--profiles-dir", "./etls/profiles/docker", "--vars", "var_cust_id: '222'",
            "--select", "standard_reports.searches"
        ],
        # What to do when the pod reaches its final state, or the execution is interrupted.
        # If False (default): do nothing, If True: delete the pod
        is_delete_operator_pod=False,
        # The secrets to pass to Pod, the Pod will fail to create if the
        # secrets you specify in a Secret object do not exist in Kubernetes.
        secrets=[],
        # Labels to apply to the Pod.
        labels={"pod-label": "label-name"},
        # Timeout to start up the Pod, default is 120.
        startup_timeout_seconds=120,
        # The environment variables to be initialized in the container
        # env_vars are templated.
        env_vars={"EXAMPLE_VAR": "/example/value"},
        # If true, logs stdout output of container. Defaults to True.
        get_logs=True,
        # Determines when to pull a fresh image, if 'IfNotPresent' will cause
        # the Kubelet to skip pulling an image if it already exists. If you
        # want to always pull a new image, set it to 'Always'.
        image_pull_policy="Always",
        # Annotations are non-identifying metadata you can attach to the Pod.
        # Can be a large range of data, and can include characters that are not
        # permitted by labels.
        annotations={"key1": "value1"},
        # Optional resource specifications for Pod, this will allow you to
        # set both cpu and memory limits and requirements.
        # Prior to Airflow 2.3 and the cncf providers package 5.0.0
        # resources were passed as a dictionary. This change was made in
        # https://github.com/apache/airflow/pull/27197
        # Additionally, "memory" and "cpu" were previously named
        # "limit_memory" and "limit_cpu"
        # resources={'limit_memory': "250M", 'limit_cpu': "100m"},
        container_resources=k8s_models.V1ResourceRequirements(
            limits={"memory": "250M", "cpu": "100m"},
        ),
        # Specifies path to kubernetes config. If no config is specified will
        # default to '~/.kube/config'. The config_file is templated.
        config_file="/home/airflow/composer_kube_config",
        # If true, the content of /airflow/xcom/return.json from container will
        # also be pushed to an XCom when the container ends.
        do_xcom_push=False,
        # List of Volume objects to pass to the Pod.
        volumes=[],
        # List of VolumeMount objects to pass to the Pod.
        volume_mounts=[],
        # Affinity determines which nodes the Pod can run on based on the
        # config. For more information see:
        # https://kubernetes.io/docs/concepts/configuration/assign-pod-node/
        # Pod affinity with the KubernetesPodOperator
        # is not supported with Composer 2
        # instead, create a cluster and use the GKEStartPodOperator
        # https://cloud.google.com/composer/docs/using-gke-operator
        affinity={},
    )

"""
kubernetes_full_pod = KubernetesPodOperator(
        task_id="ex-all-configs",
        name="pi",
        namespace="default",
        image="perl:5.34.0",
        dag=dag,
        # Entrypoint of the container, if not specified the Docker container's
        # entrypoint is used. The cmds parameter is templated.
        cmds=["perl"],
        # Arguments to the entrypoint. The docker image's CMD is used if this
        # is not provided. The arguments parameter is templated.
        arguments=["-Mbignum=bpi", "-wle", "print bpi(2000)"],
        # The secrets to pass to Pod, the Pod will fail to create if the
        # secrets you specify in a Secret object do not exist in Kubernetes.
        secrets=[],
        # Labels to apply to the Pod.
        labels={"pod-label": "label-name"},
        # Timeout to start up the Pod, default is 120.
        startup_timeout_seconds=120,
        # The environment variables to be initialized in the container
        # env_vars are templated.
        env_vars={"EXAMPLE_VAR": "/example/value"},
        # If true, logs stdout output of container. Defaults to True.
        get_logs=True,
        # Determines when to pull a fresh image, if 'IfNotPresent' will cause
        # the Kubelet to skip pulling an image if it already exists. If you
        # want to always pull a new image, set it to 'Always'.
        image_pull_policy="Always",
        # Annotations are non-identifying metadata you can attach to the Pod.
        # Can be a large range of data, and can include characters that are not
        # permitted by labels.
        annotations={"key1": "value1"},
        # Optional resource specifications for Pod, this will allow you to
        # set both cpu and memory limits and requirements.
        # Prior to Airflow 2.3 and the cncf providers package 5.0.0
        # resources were passed as a dictionary. This change was made in
        # https://github.com/apache/airflow/pull/27197
        # Additionally, "memory" and "cpu" were previously named
        # "limit_memory" and "limit_cpu"
        # resources={'limit_memory': "250M", 'limit_cpu': "100m"},
        container_resources=k8s_models.V1ResourceRequirements(
            limits={"memory": "250M", "cpu": "100m"},
        ),
        # Specifies path to kubernetes config. If no config is specified will
        # default to '~/.kube/config'. The config_file is templated.
        config_file="/home/airflow/composer_kube_config",
        # If true, the content of /airflow/xcom/return.json from container will
        # also be pushed to an XCom when the container ends.
        do_xcom_push=False,
        # List of Volume objects to pass to the Pod.
        volumes=[],
        # List of VolumeMount objects to pass to the Pod.
        volume_mounts=[],
        # Affinity determines which nodes the Pod can run on based on the
        # config. For more information see:
        # https://kubernetes.io/docs/concepts/configuration/assign-pod-node/
        # Pod affinity with the KubernetesPodOperator
        # is not supported with Composer 2
        # instead, create a cluster and use the GKEStartPodOperator
        # https://cloud.google.com/composer/docs/using-gke-operator
        affinity={},
    )
"""


python1 >> bash1 >> bash2 >> dbt_transformations