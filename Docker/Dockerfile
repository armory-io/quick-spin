FROM python:3.7-alpine3.16
MAINTAINER engineering@armory.io

ENV JAVA_HOME=/usr/lib/jvm/default-jvm \
    KUBECTL_RELEASE=1.20.6 \
    AWS_CLI_VERSION=1.21.2 \
## https://github.com/kubernetes-sigs/aws-iam-authenticator/releases
    AWS_AIM_AUTHENTICATOR_VERSION=0.5.9 \
# See https://cloud.google.com/sdk/docs/release-notes
# and https://cloud.google.com/appengine/docs/standard/java/release-notes
    GOOGLE_CLOUD_SDK_VERSION=396.0.0 \
    ECR_TOKEN_VERSION=v1.0.2

ENV PATH "$PATH:/usr/local/bin/:/opt/google-cloud-sdk/bin/:/usr/local/bin/aws-iam-authenticator:/opt/ecr-token"

RUN apk update && \
    apk upgrade && \
    apk --no-cache add --update \
    curl \
# Clouddriver requirements
    bash \
    ca-certificates \
    wget \
    openjdk11 \
    git \
    supervisor \
# mysql requirements
    mysql \
    mysql-client \
#   Deck requirements
    nginx \
    libxml2-dev \
# Gate requirements
    bash \
    openssl \
# Orca requirements
    java-cacerts && \
    true

# User and group creation
RUN adduser -D spinnaker && \
    addgroup spinnaker spinnaker && \
    adduser -D -G www-data www-data

# AWS CLI
RUN pip install --upgrade awscli==${AWS_CLI_VERSION} s3cmd==2.0.1 python-magic \
  && pip uninstall -y pip

# Google cloud SDK with anthos removed for CVE and because we don't need it
RUN wget -nv https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${GOOGLE_CLOUD_SDK_VERSION}-linux-x86_64.tar.gz \
  && mkdir -p /opt && cd /opt \
  && tar -xzf /google-cloud-sdk-${GOOGLE_CLOUD_SDK_VERSION}-linux-x86_64.tar.gz \
  && rm /google-cloud-sdk-${GOOGLE_CLOUD_SDK_VERSION}-linux-x86_64.tar.gz \
  && CLOUDSDK_PYTHON="python3" /opt/google-cloud-sdk/install.sh --usage-reporting=false --bash-completion=false  --additional-components app-engine-java app-engine-go \
  && rm -rf ~/.config/gcloud \
  && rm -rf /opt/google-cloud-sdk/.install/.backup

# kubectl + AWS IAM authenticator
RUN wget https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_RELEASE}/bin/linux/amd64/kubectl \
  && chmod +x kubectl \
  && mv ./kubectl /usr/local/bin/kubectl \
  && wget -O aws-iam-authenticator https://github.com/kubernetes-sigs/aws-iam-authenticator/releases/download/v${AWS_AIM_AUTHENTICATOR_VERSION}/aws-iam-authenticator_${AWS_AIM_AUTHENTICATOR_VERSION}_linux_amd64 \
  && chmod +x ./aws-iam-authenticator \
  && mv ./aws-iam-authenticator /usr/local/bin/aws-iam-authenticator

# Install a simple cli to get ecr token
RUN wget -nv https://github.com/armory/ecr-token/releases/download/${ECR_TOKEN_VERSION}/ecr-token_${ECR_TOKEN_VERSION}_linux_amd64.tar.gz \
  && mkdir -p /opt && cd /opt \
  && tar -xzf /ecr-token_${ECR_TOKEN_VERSION}_linux_amd64.tar.gz \
  && chmod +x ./ecr-token \
  && rm /ecr-token_${ECR_TOKEN_VERSION}_linux_amd64.tar.gz

RUN rm -rf /var/cache/apk/* && \
  wget -P /usr/local/share/ca-certificates/ https://s3.amazonaws.com/rds-downloads/rds-ca-2015-root.pem && \
  wget -P /usr/local/share/ca-certificates/ https://s3.amazonaws.com/rds-downloads/rds-ca-2019-root.pem && \
  update-ca-certificates && \
  ln -sf /etc/ssl/certs/java/cacerts /usr/lib/jvm/default-jvm/jre/lib/security/cacerts

# -- Install clouddriver --
COPY --from=armory/clouddriver-armory:2022.08.03.03.46.46.release-2.28.x /opt/clouddriver /opt/clouddriver

# -- Install deck --

COPY --from=armory/deck-armory:2022.07.14.16.52.46.release-2.28.x /opt/deck/html  /opt/deck/html

COPY spinnaker-config/settings.js spinnaker-config/plugin-manifest.json /opt/deck/html/

# -- Install gate --
COPY --from=armory/gate-armory:2022.08.03.03.23.19.release-2.28.x /opt/gate /opt/gate

# -- Override armory-header plugin --
RUN wget https://github.com/armory-plugins/armory-header/releases/download/v0.1.1/armory-header-v0.1.1.zip \
    && mv ./armory-header-v0.1.1.zip /opt/gate/plugins/ \
    && cd /opt/gate/plugins \
    && rm -rf armory-header-v0.1.0 armory-header-v0.1.0.zip Armory.ArmoryHeader-armory-header-v0.1.0 Armory.ArmoryHeader-armory-header-v0.1.0.zip

COPY spinnaker-config/deck-plugins/plugins.json /opt/gate/local-plugin-repo/

# -- Install orca --

COPY --from=armory/orca-armory:2022.08.03.03.33.08.release-2.28.x /opt/orca /opt/orca

# -- Install front50 --

COPY --from=armory/front50-armory:2022.08.03.21.55.44.release-2.28.x /opt/front50 /opt/front50
# Create a directory that matches liquibase changelog path
RUN mkdir -p /db/changelog
COPY db/front50/changelog/default-app-and-pipeline.yml /db/changelog/default-app-and-pipeline.yml
# Add changelog to existing jar so it's available on classpath
RUN jar uf /opt/front50/lib/front50-sql-2022.08.02.17.26.34.release-1.28.x.jar  /db/changelog/default-app-and-pipeline.yml


# -- Install echo --
COPY --from=armory/echo-armory:2022.08.03.03.22.30.release-2.28.x /opt/echo /opt/echo
COPY spinnaker-config /opt/spinnaker/config

# Install Mysql
RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld
RUN chown -R mysql:mysql /var/lib/mysql
RUN mysql_install_db --user=mysql --ldata=/var/lib/mysql > /dev/null

# Initialize Mysql
COPY db/init.sql /opt/spinnaker/init.sql
RUN (/usr/bin/mysqld_safe &) ; sleep 3 ; /usr/bin/mysql -u root < /opt/spinnaker/init.sql

# Ownerships
RUN chown -R spinnaker:spinnaker /opt/clouddriver/plugins && \
    chown -R spinnaker:spinnaker /opt/gate/plugins && \
    chown -R spinnaker:spinnaker /opt/gate/deck-plugins && \
    chown -R spinnaker:spinnaker /opt/gate/local-plugin-repo && \
    chown -R spinnaker:spinnaker /opt/front50/plugins && \
    chown -R spinnaker:spinnaker /opt/orca/plugins && \
    chown -R spinnaker:spinnaker /opt/spinnaker/config && \
    chown -R www-data:www-data /opt/deck

# -- Supervisor D --
# Copy Superviosrd configuration
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY supervisord.conf /etc/supervisord.conf

COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY nginx/nginx.conf /etc/nginx/conf.d/default.conf

COPY start.sh /home/spinnaker/start.sh
RUN chmod o+x /home/spinnaker/start.sh

WORKDIR /home/spinnaker

EXPOSE 80

CMD /home/spinnaker/start.sh
