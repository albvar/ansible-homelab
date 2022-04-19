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
tail -f cat /var/log/auth.log # troubleshoot shh key issues on target host
```