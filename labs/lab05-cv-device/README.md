# LAB 05 - CloudVision EOS Devices

## Initial configuration

> Only if you are running on your own

```shell
$ make configure
```

![](../../imgs/lab05-topology.png)

## Execute lab

1. __Run device playbook__

```shell
$ ansible-playbook playbook.device.yml
```

2. __Create a new container and move device__

```yaml
# edit group_vars/CVP.yml
CVP_DEVICES:
  TEAM01-device01-SPINE1:
    name: TEAM01-device01
    parentContainerName: TEAM01-DEVICE01
    configlets:
        - TEAM01-DEVICE01
CVP_CONTAINERS:
  TEAM01-DEVICE01:
    parent_container: Tenant

# edit playbook.device.yml
- name: "Gather CVP facts {{inventory_hostname}}"
  arista.cvp.cv_facts:
  register: CVP_FACTS

- name: "Configure containers on {{inventory_hostname}}"
  arista.cvp.cv_container:
    cvp_facts: "{{CVP_FACTS.ansible_facts}}"
    topology: "{{CVP_CONTAINERS}}"
    save_topology: true
  register: CVP_CONTAINERS_RESULT

- name: "Gather CVP facts {{inventory_hostname}}"
  arista.cvp.cv_facts:
  register: CVP_FACTS

- name: "Configure devices on {{inventory_hostname}}"
  arista.cvp.cv_device:
    devices: "{{CVP_DEVICES}}"
    cvp_facts: '{{CVP_FACTS.ansible_facts}}'
    device_filter: ['STUDENT_DEVICE']
    # state: present
  register: CVP_DEVICES_RESULTS
```
