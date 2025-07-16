FROM rockylinux/rockylinux:9.6
WORKDIR /workdir/
# Install base packages for initial ansible provisioning
RUN dnf update -y \
    && dnf install -y \
    crontabs \
    gcc \
    initscripts \
    libcurl \
    openssh-server \
    openssl-devel \
    python3.12 \
    python3.12-devel \
    python3.12-pip \
    rsync \
    sudo \
    systemd \
    systemd-sysv \
    --allowerasing
# Create a shared ssh key. This image is used for each container, so the
# ansible 'provisioner' container is able to ssh onto the other containers.
RUN mkdir -p /root/.ssh && \
    ssh-keygen -t rsa -b 4096 -f /root/.ssh/id_rsa -N "" && \
    cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys && chmod 600 /root/.ssh/authorized_keys
COPY provisioning/requirements.txt provisioning/requirements.txt
RUN python3.12 -m venv ~/provision_venv && \
    ~/provision_venv/bin/pip install pip==25.0 wheel==0.44.0 setuptools==80.9.0 && \
    ~/provision_venv/bin/pip install -r provisioning/requirements.txt
CMD [ "/sbin/init" ]