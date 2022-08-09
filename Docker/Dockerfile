FROM python:3.7-alpine3.16
MAINTAINER engineering@armory.io

ENV KUBECTL_RELEASE=1.20.6
ENV AWS_CLI_VERSION=1.21.2
## https://github.com/kubernetes-sigs/aws-iam-authenticator/releases
ENV AWS_AIM_AUTHENTICATOR_VERSION=0.5.9
# See https://cloud.google.com/sdk/docs/release-notes
# and https://cloud.google.com/appengine/docs/standard/java/release-notes
ENV GOOGLE_CLOUD_SDK_VERSION=396.0.0
ENV ECR_TOKEN_VERSION=v1.0.2
ENV PATH "$PATH:/usr/local/bin/:/opt/google-cloud-sdk/bin/:/usr/local/bin/aws-iam-authenticator:/opt/ecr-token"

# Clouddriver requirements
RUN apk update \
  && apk upgrade \
  && apk --no-cache add --update \
    bash \
    ca-certificates \
    wget \
    openjdk11 \
    git \
    supervisor

# Deck requirements
RUN apk --no-cache --update add \
  apache2 \
  apache2-ctl \
  apache2-http2 \
  apache2-proxy \
  apache2-ssl \
  apache2-utils \
  libxml2-dev \
  && true

# Gate requirements
RUN apk --nocache add --update \
  bash \
  openssl

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

# -- Install clouddriver --
COPY install/clouddriver /opt/clouddriver

RUN adduser -D spinnaker \
  && addgroup spinnaker spinnaker \
  && mkdir -p /opt/clouddriver/plugins \
  && chown -R spinnaker:spinnaker /opt/clouddriver/plugins

## Bake plugins
COPY install/plugins /opt/clouddriver/plugins

# -- Install deck --
#COPY install/deck-build/dist /opt/deck/html/

COPY install/deck-docker /opt/deck/bin

WORKDIR /opt/deck

RUN adduser -D -G www-data www-data

RUN bin/setup-apache2.sh

RUN chown -R www-data:www-data /opt/deck

# -- Install gate --
COPY install/gate /opt/gate

RUN mkdir -p /opt/gate/plugins && chown -R spinnaker:spinnaker /opt/gate/plugins && \
  mkdir -p /opt/gate/deck-plugins && chown -R spinnaker:spinnaker /opt/gate/deck-plugins && \
  mkdir -p /opt/gate/local-plugin-repo && chown -R spinnaker:spinnaker /opt/gate/local-plugin-repo

## Bake plugins
## COPY true is due to this issue: https://github.com/moby/moby/issues/37965
COPY install/plugins /opt/gate/plugins
RUN true
COPY install/deck-plugins /opt/gate/deck-plugins
RUN true
COPY install/local-plugin-repo /opt/gate/local-plugin-repo

# Copy Superviosrd configuration
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

WORKDIR /home/spinnaker

# Run Supervisord
CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
