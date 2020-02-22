![Arista CVP Automation](https://img.shields.io/badge/Arista-CVP%20Automation-blue) 

# Ansible CVP TOI

## About

This repository is part of `arista.cvp` ansible collection and provides lab materials. It contains both lab setup playbooks and lab playbooks for one team.

__List of available labs:__

- _Lab 01_: [Ansible Basics](labs/lab01-ansible-basics)
- _Lab 02_: [CloudVision Collection overview](labs/lab02-arista.cvp-overview)
- _Lab 03_: [Configlets](labs/lab03-cv-configlets)
- _Lab 04_: [Containers](labs/lab04-cv-containers)
- _Lab 05_: [Devices](labs/lab05-cv-device)
- _Lab 06_: [Tasks](labs/lab05-cv-tasks)

<p align="center">
  <img src='imgs/cv_ansible_logo.png' alt='Arista CloudVision and Ansible'/>
</p>

## TOI Lab preparation

All the labs have been built using Arista Test Drive topology. Start an ATD or ask to your Arista representative to access to a lab.

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

__Configure CloudVision IP Address__

Go to [`labs`](labs/) folder and do the following command:

```shell
$ cd labs

# Edit inventory file
$ vim inventory.yml
```