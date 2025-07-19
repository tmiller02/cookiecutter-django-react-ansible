# Use Ubuntu 24.04 as the base image
FROM ubuntu:24.04
USER root
WORKDIR /workdir/
# Install base packages for initial ansible provisioning
RUN apt update -y \
    && apt upgrade -y \
    && apt install -y \
    cron \
    gcc \
    libcurl4 \
    libssl-dev \
    openssh-client \
    openssh-server \
    pipx \
    python3-debian \
    python3-dev \
    python3-pip \
    python3-venv \
    rsync \
    sudo \
    systemd \
    systemd-sysv
RUN pipx install uv==0.8.0
# Create a shared ssh key for ansible provisioning.
# This image is used for each container, so the ansible 'provisioner' container is able to ssh onto the other containers.
RUN mkdir -p /root/.ssh && \
    ssh-keygen -t rsa -b 4096 -f /root/.ssh/id_rsa -N "" && \
    cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys && chmod 600 /root/.ssh/authorized_keys
WORKDIR /workdir/provisioning/
# Copy Python requirements for Ansible provisioning
COPY provisioning/pyproject.toml pyproject.toml
COPY provisioning/uv.lock uv.lock
# Create Ansible Python virtual environment and install required packages.
# We avoid using the standard .venv directory with uv to ensure this
# is still available when setting a bind mount on this directory.
RUN UV_PROJECT_ENVIRONMENT=~/provision_venv/ ~/.local/bin/uv venv --system-site-packages && \
    UV_PROJECT_ENVIRONMENT=~/provision_venv/ ~/.local/bin/uv sync
# Copy Ansible Galaxy requirements file
COPY provisioning/requirements.yml requirements.yml
# Install Ansible roles and collections
RUN ~/provision_venv/bin/ansible-galaxy install -r requirements.yml
# Start systemd when container launches
CMD [ "/sbin/init" ]