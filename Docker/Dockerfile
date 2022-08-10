FROM python:3.7-alpine3.16
MAINTAINER engineering@armory.io

ENV JAVA_HOME=/usr/lib/jvm/default-jvm
ENV KUBECTL_RELEASE=1.20.6
ENV AWS_CLI_VERSION=1.21.2
## https://github.com/kubernetes-sigs/aws-iam-authenticator/releases
ENV AWS_AIM_AUTHENTICATOR_VERSION=0.5.9
# See https://cloud.google.com/sdk/docs/release-notes
# and https://cloud.google.com/appengine/docs/standard/java/release-notes
ENV GOOGLE_CLOUD_SDK_VERSION=396.0.0
ENV ECR_TOKEN_VERSION=v1.0.2
ENV PATH "$PATH:/usr/local/bin/:/opt/google-cloud-sdk/bin/:/usr/local/bin/aws-iam-authenticator:/opt/ecr-token"

RUN apk update \
  && apk upgrade

RUN apk --no-cache add --update \
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
# Deck requirements
  apache2 \
  apache2-ctl \
  apache2-http2 \
  apache2-proxy \
  apache2-ssl \
  apache2-utils \
  libxml2-dev \
# Gate requirements
  bash \
  openssl \
# Orca requirements
  java-cacerts \
  && true

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

RUN adduser -D spinnaker
RUN addgroup spinnaker spinnaker
RUN chown -R spinnaker:spinnaker /opt/clouddriver/plugins

# -- Install deck --

COPY --from=armory/deck-armory:2022.07.14.16.52.46.release-2.28.x /opt/deck /opt/deck

WORKDIR /opt/deck

RUN adduser -D -G www-data www-data

RUN bin/setup-apache2.sh

RUN chown -R www-data:www-data /opt/deck

# -- Install gate --
COPY --from=armory/gate-armory:2022.08.03.03.23.19.release-2.28.x /opt/gate /opt/gate

RUN chown -R spinnaker:spinnaker /opt/gate/plugins && \
    chown -R spinnaker:spinnaker /opt/gate/deck-plugins && \
    chown -R spinnaker:spinnaker /opt/gate/local-plugin-repo

# -- Install orca --

COPY --from=armory/orca-armory:2022.08.03.03.33.08.release-2.28.x /opt/orca /opt/orca

RUN chown -R spinnaker:spinnaker /opt/orca/plugins

# -- Install front50 --

COPY --from=armory/front50-armory:2022.08.03.21.55.44.release-2.28.x /opt/front50 /opt/front50

RUN chown -R spinnaker:spinnaker /opt/front50/plugins


# -- Install echo --
COPY --from=armory/echo-armory:2022.08.03.03.22.30.release-2.28.x /opt/echo /opt/echo

RUN mkdir -p /etc/ssl/certs/java
RUN mv -f $JAVA_HOME/lib/security/cacerts /etc/ssl/certs/java/cacerts
RUN ln -sf /etc/ssl/certs/java/cacerts $JAVA_HOME/lib/security/cacerts
RUN chown -R spinnaker:spinnaker /opt/echo/plugins

COPY spinnaker-config /opt/spinnaker/config

RUN chown -R spinnaker:spinnaker /opt/spinnaker/config

# -- Supervisor D --
# Copy Superviosrd configuration
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Initialize MariaDB
#RUN /etc/init.d/mariadb setup

WORKDIR /home/spinnaker

# Run Supervisord
CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
