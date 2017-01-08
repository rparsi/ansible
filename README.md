# ansible
Ansible files for provisioning linux servers, for software development (many languages).


# To run playbooks locally (the current user must have sudo rights)
$ ansible-playbook plays/name-of-playbook.yml -l name-of-local-machine --connection=local


# Ansible master server First Time setup:
1. Login with account that has sudo rights
2. Upload ansible-setup.sh
3. Create ansible-admin.settings file (refer to ansible-admin.settings.dist)
4. Run ansible-setup.sh
5. Login as ansible-admin, generate ssh keys
$ ssh-keygen -t rsa -b 4096 -C email@address
6. Upload ansible playbook related files/directories
7. Edit vars/hosts adding entry for ansible-master
8. Run the ansible-server-setup.yml playbook
$ ansible-playbook plays/ansible-server-setup.yml -l ansible-master --connection=local


# Managed server (ansible client) First Time setup:
1. Login into client server with account that has sudo rights
2. Upload ansible-setup.sh
3. Create ansible-admin.settings file (refer to ansible-admin.settings.dist)
4. Run ansible-setup.sh
5. Login into ansible master server as ansible-admin
6. Add the ssh public key to the new client
$ ssh-copy-id ansible-client-hostname
7. Update vars/hosts
8. Update vars/users.json
9. Run the dev-server-setup.yml playbook against the client.
$ ansible-playbook plays/dev-server-setup.yml -l ansible-client-hostname