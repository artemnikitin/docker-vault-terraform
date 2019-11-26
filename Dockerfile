FROM ubuntu:18.04

ENV VAULT_VERSION 1.3.0
ENV VAULT_ZIP vault_$VAULT_VERSION_linux_amd64.zip
ENV VAULT_URL https://releases.hashicorp.com/vault/$VAULT_VERSION/$VAULT_ZIP
ENV TERRAFORM_VERSION 0.12.16
ENV TERRAFORM_ZIP terraform_$TERRAFORM_VERSION_linux_amd64.zip
ENV TERRAFORM_URL https://releases.hashicorp.com/terraform/$TERRAFORM_VERSION/$TERRAFORM_ZIP

# Install prerequisites
RUN apt-get update && apt-get --no-install-recommends -y install \
    jq \
    wget \
    unzip \
    ca-certificates && \
    apt-get clean && apt-get autoclean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install Vault
RUN wget $VAULT_URL && \
    unzip $VAULT_ZIP && \
    mv vault /usr/local/bin/vault && \
    rm $VAULT_ZIP

# Install Terraform
RUN wget $TERRAFORM_URL && \
    unzip $TERRAFORM_ZIP && \
    mv terraform /usr/local/bin/terraform && \
    rm $TERRAFORM_ZIP
