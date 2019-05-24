FROM ubuntu:18.04

ENV VAULT_ZIP vault_1.1.2_linux_amd64.zip
ENV VAULT_URL https://releases.hashicorp.com/vault/1.1.2/$VAULT_ZIP
ENV TERRAFORM_ZIP terraform_0.12.0_linux_amd64.zip
ENV TERRAFORM_URL https://releases.hashicorp.com/terraform/0.12.0/$TERRAFORM_ZIP

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
    mv vault /usr/local/bin/vault

# Install Terraform
RUN wget $TERRAFORM_URL && \
    unzip $TERRAFORM_ZIP && \
    mv terraform /usr/local/bin/terraform
