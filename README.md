# Ansible System Setup

For setting up new machines based on their role

## Quick Install

```bash
curl -fsSL https://github.com/rahulsalvi/system-setup/releases/latest/download/install.sh | sudo bash
```

## Usage

1. Bootstrap the machine with the appropriate role:

```bash
ansible-pull -K -U https://github.com/rahulsalvi/system-setup.git \
  -e machine_role="desktop" \
  bootstrap.yml
```

See `bootstrap.yml` for valid roles.

To override role defaults, pass `role_vars` as comma-separated key=value pairs:

```bash
ansible-pull -K -U https://github.com/rahulsalvi/system-setup.git \
  -e machine_role="laptop" \
  -e role_vars="secure_boot_install_microsoft_keys=false" \
  bootstrap.yml
```

1. Confirm `/etc/ansible/hosts` is correct, then run the main playbook:

```bash
ansible-pull -K -U https://github.com/rahulsalvi/system-setup.git
```

## Local Testing

```bash
ansible-playbook local.yml -c local -K
# for a dry run, use --check and --diff
ansible-playbook local.yml -c local -K --check --diff
```
