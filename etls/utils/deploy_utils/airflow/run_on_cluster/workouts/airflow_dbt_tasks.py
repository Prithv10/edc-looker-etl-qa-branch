
from airflow.operators.bash_operator import BashOperator
from airflow.providers.cncf.kubernetes.operators.kubernetes_pod import KubernetesPodOperator

from kubernetes.client import models as k8s_models
from kubernetes.client import models as k8s

class airflow_dbt_tasks:
    # define python function for PythonOperator
    def get_bash1_op(self,dag):
        bash1_start = BashOperator(
            task_id='start',
            bash_command='echo "The Airflow job has started "',
            dag=dag
        )
        return bash1_start

    def get_bash2_op(self,dag):
        bash2_complete = BashOperator(
            task_id='complete',
            bash_command='echo "The Airflow job has completed"',
            dag=dag
        )
        return bash2_complete

    # Airflow dags dataflow starts -----

    def run_dbt_full_refresh(self,dag,org_list):
        for orgid in org_list:
                dbt_transforms_full_refresh = KubernetesPodOperator(
                        task_id="dbt_transforms_task_full_refresh_{}".format(orgid),
                        name="dbt_transforms_full_refresh_{}".format(orgid),
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
                            "--project-dir", "./etls", "--profiles-dir", "./etls/profiles/docker", "--vars",
                            "var_cust_id: {}".format(orgid), "--select", "standard_reports.searches",
                            "--full-refresh"
                        ],
                        # What to do when the pod reaches its final state, or the execution is interrupted.
                        # If False (default): do nothing, If True: delete the pod
                        is_delete_operator_pod=True,
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
                self.get_bash1_op(dag) >> dbt_transforms_full_refresh >> self.get_bash2_op(dag)

    def run_dbt_incremental(self,dag,org_list):
        for orgid in org_list:
            dbt_transforms_incremental = KubernetesPodOperator(
                task_id="dbt_transforms_task_incremental_{}".format(orgid),
                name="dbt_transforms_incremental_{}".format(orgid),
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
                    "--project-dir", "./etls", "--profiles-dir", "./etls/profiles/docker", "--vars",
                    "var_cust_id: {}".format(orgid), "--select", "standard_reports.searches"
                ],
                # What to do when the pod reaches its final state, or the execution is interrupted.
                # If False (default): do nothing, If True: delete the pod
                is_delete_operator_pod=True,
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
            self.get_bash1_op(dag) >> dbt_transforms_incremental >> self.get_bash2_op(dag)
