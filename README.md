# Ansible System Setup

For setting up new machines based on their role

## Usage

1. create inventory file `/etc/ansible/hosts` with appropriate groups

```bash
[localhost]
desktops
```

1. run this playbook with `ansible-pull`

```bash
ansible-pull -K -U https://github.com/rahulsalvi/system-setup.git
```

## Local Testing

```bash
ansible-playbook local.yml -c local -K
# for a dry run, use --check and --diff
ansible-playbook local.yml -c local -K --check --diff
```
