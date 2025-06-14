# Ansible System Setup

For setting up new machines based on their role

## Usage

1. create inventory file `/etc/ansible/hosts` with appropriate groups

```bash
[localhost]
desktops
```

2. run this playbook with `ansible-pull`

```bash
ansible-pull -K -U https://github.com/rahulsalvi/system-setup.git
```
