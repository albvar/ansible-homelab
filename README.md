# ansible-homelab

Personal use repo

## STEP 1 Create Key on Ansible host

```bash
ssh-keygen -C "ansible"
```

## STEP 2 Distribute key to servers going to be managed

```bash
ssh-copy-id -i ~/.ssh/ansible media@media
# Test connectivity
ssh -i ~/.ssh/ansible media@media
```
## Executing playbooks

```bash
cd ansible-homelab
ansible all -m ping
```

## Running ansible playbooks

```bash
ansible-playbook --ask-become-pass bootstrap.yml
# bootstrap new computer in inventory user@dnsname
# modify ansible.cfg remove remote_user & private_key file
```

## Running ansible playbooks on winhost

```bash
ansible winhost -m win_ping -v
```

## Using git

```bash
git clone with ssh key after adding ssh key to git
git add README.md
git commit -m "updated readme, initial commit"
git push
```

## Misc

```bash
cat /etc/os-release
tail -f cat /var/log/auth.log # troubleshoot ssh key issues on target host
```

## Dependencies

```bash
ansible-galaxy collection install ansible.windows
ansible-galaxy collection install community.windows
```

## Ansible vault

```bash
ansible-vault encrypt --vault-password-file ~/.vault_key winsecret.txt
ansible-vault edit --vault-password-file ~/.vault_key file.txt
ansible-vault view --vault-password-file ~/.vault_key group_vars/win/vault
```