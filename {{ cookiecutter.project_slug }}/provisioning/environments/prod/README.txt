This is a sample production inventory file containing placeholder variables.

Please replace all placeholder values (e.g., "<my-placeholder>") with appropriate values for your production environment.

If you plan to use a managed database service such as Amazon RDS instead of provisioning PostgreSQL on a VM, leave the [database] group empty in the inventory and update the 'backend_app_database_host' setting to reference your database endpoint.

For security, it is strongly recommended to store sensitive variables such as 'database_password' and 'backend_app_secret_key' using ansible-vault, rather than keeping them in plain text. Refer to:
- https://docs.ansible.com/ansible/latest/user_guide/vault.html
- https://docs.ansible.com/ansible/latest/user_guide/playbooks_best_practices.html#variables-and-vaults
for more information and best practices.