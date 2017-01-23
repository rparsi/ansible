# ansible
Ansible files for provisioning linux servers, for software development (many languages).


# FYI: To run playbooks locally (the current user must have sudo rights)
$ ansible-playbook plays/name-of-playbook.yml -l name-of-local-machine --connection=local


# Setup
One server will be designated as the ansible 'master', meaning that ansible
playbooks will be run there.  Whatever is in the hosts file (aka inventory)
are considered as ansible 'clients'.

The ansible master will run playbooks to provision ansible clients.
However you can run any of the playbooks locally.


# Prerequisites
1. You have ssh keys already generated for the 'ansible-admin' user
plus any other users you want to add (to any server).
Use following command to generate ssh keys
$ ssh-keygen -t rsa -b 4096
2. You run the ansible-setup.sh script as a user that has sudo rights.


# Ansible master server First Time setup:
1. Upload ansible-setup.sh
2. Create ansible-admin.settings file (refer to ansible-admin.settings.dist)
3. Run ansible-setup.sh
4. Upload ansible playbook related files/directories
5. Edit vars/hosts adding entry for ansible-master
6. Run the ansible-server-setup.yml playbook locally
$ ansible-playbook plays/ansible-server-setup.yml -l ansible-master --connection=local


# Ansible client First Time setup:
1. Upload ansible-setup.sh
2. Create ansible-admin.settings file (refer to ansible-admin.settings.dist)
3. Run ansible-setup.sh
4. Login into ansible master server as ansible-admin
5. Add the ssh public key to the new client
$ ssh-copy-id ansible-client-hostname
6. Update vars/hosts
7. Update vars/users.json
8. Run the dev-server-setup.yml playbook against the client
$ ansible-playbook plays/dev-server-setup.yml -l ansible-client-hostname