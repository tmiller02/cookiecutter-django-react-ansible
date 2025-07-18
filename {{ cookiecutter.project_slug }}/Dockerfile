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
    python3-debian \
    python3-dev \
    python3-pip \
    python3-venv \
    rsync \
    sudo \
    systemd \
    systemd-sysv
# Create a shared ssh key. This image is used for each container, so the
# ansible 'provisioner' container is able to ssh onto the other containers.
RUN mkdir -p /root/.ssh && \
    ssh-keygen -t rsa -b 4096 -f /root/.ssh/id_rsa -N "" && \
    cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys && chmod 600 /root/.ssh/authorized_keys
COPY provisioning/requirements.txt provisioning/requirements.txt
RUN python3.12 -m venv ~/provision_venv --system-site-packages && \
    ~/provision_venv/bin/pip install pip==25.0 wheel==0.44.0 setuptools==80.9.0 && \
    ~/provision_venv/bin/pip install -r provisioning/requirements.txt
COPY provisioning/requirements.yml provisioning/requirements.yml
RUN ~/provision_venv/bin/ansible-galaxy install -r provisioning/requirements.yml
CMD [ "/sbin/init" ]