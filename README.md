![Arista CVP Automation](https://img.shields.io/badge/Arista-CVP%20Automation-blue) 

# Ansible CVP TOI

## About

This repository is part of `arista.cvp` ansible collection and provides lab materials. It contains both lab setup playbooks and lab playbooks for one team.

List of labs available:

- _Lab 01_: [Ansible Basics](labs/lab01-ansible-basics)
- _Lab 02_: [CloudVision Facts](labs/lab02-arista.cvp-overview)
- _Lab 03_: [Configlets](labs/lab03-cv-configlets)
- _Lab 04_: [Containers](labs/lab04-cv-containers)
- _Lab 05_: [Devices](labs/lab05-cv-tasks)

```
├── lab-provisionning
│   ├── collections
│   │   └── ansible_collections
│   ├── eos_configs
│   │   └── base_configs
│   ├── group_vars
│   │   └── all
│   ├── lab_definitions
│   ├── roles
│   │   └── ztp-setup
│   └── templates
└── labs
    ├── collections
    │   └── ansible_collections
    ├── lab01-ansible-basics
    │   ├── group_vars
    │   └── host_vars
    ├── lab02-arista.cvp-overview
    ├── lab03-cv-configlets
    │   └── group_vars
    ├── lab04-cv-containers
    │   └── group_vars
    ├── lab05-cv-device
    │   └── group_vars
    └── lab06-cv-tasks
        └── group_vars
```

## Lab Environment

TBD

## Install environment

Run TOI in a python's virtual environment:

__Install venv__

```shell
# Install virtualenv if not part of your system
$ python -m pip install virtualenv

# Create a virtual env named .venv
$ virtualenv --no-site-packages -p $(which python2.7) .venv

# Activate virtualenv
$ source .venv/bin/activate
```

__Install Ansible__

```shell
$ pip install ansible==2.9
```

## TOI preparation

### Configure ZTP server with new devices

__Edit [`lab-provisioning/group_vars/ZTP/ztp_config.yml`](lab-provisioning/group_vars/ZTP/ztp_config.yml)__

In this file, you can define 

- List of student group name
- Device Hostname
- Group membership of every device
- Device mac-address

```yaml
---
[...]
  groupAttendees:
    - TEAM01
    - TEAM02
    - TEAM03
  clients:
    - name: device01
      mac: 0c:1a:c1:00:00:01
      ip4: 10.255.0.111
      group: TEAM01
```

You can also configure CloudVision IP address used to support ZTP and device connectivity.

```yaml
ztp:
  general:
    network: 10.255.0.0
    netmask: 255.255.255.0
    gateway: 10.255.0.1
    nameserver: '1.1.1.1, 8.8.8.8'
    start: 10.255.0.200
    end: 10.255.0.250
    cvp: 10.255.0.1
    registration: 'http://10.255.0.1/ztp/bootstrap'
```

__Update Inventory__

```ini
$ cat inventory.ini

[CloudVision:vars]
ansible_httpapi_host= 10.83.28.164
ansible_host= 10.83.28.164
ansible_user= ansible
ansible_password= ansible
# Configuration to get Virtual Env information
ansible_python_interpreter= $(which python)

[ZTP:vars]
ansible_host= 10.83.28.164
ansible_user= root
ansible_password= ansible
```

__Run playbook__

```shell
# Move to provisioning folder
$ cd lab-provisionning

# Run playbook
$ ansible-playbook lab-content-provisionning.yml
```
This playbook configures:
- Zero Touch Provisioning on CV server
- Base Config for EOS devices
- Lab definition to build/reset labs

### Student lab configuration

Go to [`labs`](labs/) folder and do the following command:

```shell
$ make GROUP=<YOUR GROUP NAME> DEVICE=<DEVICE NAME> configure
```