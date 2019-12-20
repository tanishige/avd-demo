![](https://img.shields.io/badge/Arista-CVP%20Automation-blue) 

# Ansible CVP TOI

## About

This repository is part of `arista.cvp` ansible collection and provides lab materials. It contains both lab setup playbooks and lab playbooks for one team.

```
├── lab-provisioning
│   ├── collections
│   │   └── ansible_collections
│   │       └── arista
│   │           └── cvp
│   │               ├── plugins
│   │               │   ├── module_utils
│   │               │   └── modules
│   │               └── tests
│   ├── eos_configs
│   │   └── lab02
│   ├── group_vars
│   │   └── ZTP
│   ├── lab_definitions
│   └── roles
│       └── ztp-setup
└── team01
    ├── lab01-ansible-basics
    │   ├── group_vars
    │   └── host_vars
    ├── lab02-arista.cvp-overview
    │   ├── group_vars
    │   └── host_vars
    ├── lab03-cv-configlets
    │   └── group_vars
    ├── lab04-cv-containers
    │   └── group_vars
    ├── lab05-cv-device
    │   └── group_vars
    └── lab06-cv-tasks
        └── group_vars
```

List of labs available:

- Lab 01: Ansible Basics
- Lab 02: CloudVision Facts
- Lab 03: Configlets
- Lab 04: Containers
- Lab 05: Devices

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

### Create new team folder

To scale number of attendees, it is required to create new team folders:

```shell
# Clone team01 to team101
$ make id=101 clone
```

### Configure ZTP server with new devices

__Edit lab-provisioning/group_vars/ZTP/ztp_config.yml__

Add mac-address and ip addresses to the list

```yaml
  clients:
  # Team 01 Topology
    - name: TEAM01-SPINE1
      mac: 0c:1a:c1:00:00:01
      ip4: 10.255.0.111
```

__Run playbook__

```shell
# Move to provisioning folder
$ cd lab-provisioning

# Run playbook
$ ansible-playbook ztp-configuration.yml
```

