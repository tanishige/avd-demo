![Arista CVP Automation](https://img.shields.io/badge/Arista-CVP%20Automation-blue) 

# Ansible CVP TOI

## About

This repository is part of `arista.cvp` ansible collection and provides lab materials. It contains both lab setup playbooks and lab playbooks for one team.

__List of available labs:__

- _Lab 01_: [Ansible Basics](labs/lab01-ansible-basics)
- _Lab 02_: [CloudVision Facts](labs/lab02-arista.cvp-overview)
- _Lab 03_: [Configlets](labs/lab03-cv-configlets)
- _Lab 04_: [Containers](labs/lab04-cv-containers)
- _Lab 05_: [Devices](labs/lab05-cv-tasks)

<p align="center">
  <img src='imgs/cv_ansible_logo.png' alt='Arista CloudVision and Ansible'/>
</p>

## TOI Lab preparation

To prepare a complete TOI, some notes are available in [lab-provisionning](lab-provisionning) folder.

It gives some highlights about:
- ZTP configuration.
- Lab topology definition.
- Attendees scaling.


## Install TOI environment

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

__Configure attendee group__

Go to [`labs`](labs/) folder and do the following command:

```shell
$ cd labs

$ make GROUP=<YOUR GROUP NAME> DEVICE=<DEVICE NAME> configure
```