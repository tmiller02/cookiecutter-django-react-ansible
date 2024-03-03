podman compose --file compose.yaml exec --user developer provisioner bash -c '
  sudo apt-get update
  sudo apt-get install -y curl rsync python3 python3-venv python3-pip python3-apt libssl-dev
  python3.10 -m venv ~/provisioning_venv --system-site-packages
  source ~/provisioning_venv/bin/activate
  pip install pip==23.3.1 wheel==0.41.3
  pip install -r /workspace/provisioning/requirements.txt --no-deps
  cd /workspace/provisioning/
  sudo ~/provisioning_venv/bin/ansible-galaxy install --role-file=requirements.yml
  ANSIBLE_CONFIG=ansible_vagrant.cfg ~/provisioning_venv/bin/ansible-playbook playbook.yml \
   --inventory environments/dev/inventory \
   --extra-vars "ansible_user=developer ansible_password=developer"
'