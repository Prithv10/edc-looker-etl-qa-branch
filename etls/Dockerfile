FROM python:3.9.13

# Update and install system packages
RUN apt-get update -y && \
  apt-get install --no-install-recommends -y -q \
  git libpq-dev && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Set environment variables
ENV DBT_DIR /dbt

# Set working directory
WORKDIR $DBT_DIR

# Copy requirements
COPY requirements.txt .

# Install DBT
RUN pip install -U pip
RUN pip install -r requirements.txt

# Add dbt_project_1 to the docker image
#COPY etls ./etls
COPY etls ./etls
#COPY composer_kube_config ./composer_kube_config
#RUN ["mkdir","-p","composer_kube_config"]
#COPY config $DBT_DIR/composer_kube_config/config
RUN ["dbt", "deps", "--project-dir", "./etls"]
