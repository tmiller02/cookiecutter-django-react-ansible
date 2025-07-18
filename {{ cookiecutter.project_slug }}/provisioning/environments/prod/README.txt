This is a sample production inventory with placeholder variables.

You should update placeholder values such as "<my-placeholder>" with appropriate
values for your production environment.

If you want to use a managed database service such as RDS rather than provisioning
PostgreSQL onto a VM, leave the [database] group empty in the inventory and
update the 'backend_app_database_host' setting to point to your database.

You are STRONGLY ADVISED to store sensitive variables such as
'database_password' and 'backend_app_secret_key' using ansible-vault rather
than storing these values in plain text as is used here. Please see
https://docs.ansible.com/ansible/latest/user_guide/vault.html and
https://docs.ansible.com/ansible/latest/user_guide/playbooks_best_practices.html#variables-and-vaults
for more information.