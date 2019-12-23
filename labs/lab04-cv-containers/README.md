# LAB 04 - CloudVision Containers

## Initial configuration

> Only if you are running on your own

```shell
$ make configure
```

![](../../imgs/lab02-topology.png)

## Execute lab

__1. Run container playbook__

```shell
$ ansible-playbook playbook.container.yml
```

2. __Attach GLOBAL-ALIASES to TEAMXX_DC__

```yaml
# edit group_vars/CVP.yml
CVP_CONTAINERS:
  STUDENT_DEVICE_DC:
    parent_container: STUDENT_DEVICE
    configlets:
      - 'GLOBAL-ALIASES'
```

3. __Remove container topology__

```yaml
# edit playbook.container.yml
- name: "Configure containers on {{inventory_hostname}}"
    arista.cvp.cv_container:
      cvp_facts: "{{CVP_FACTS.ansible_facts}}"
      topology: "{{CVP_CONTAINERS}}"
      save_topology: true
      mode: delete
    register: CVP_CONTAINERS_RESULT
```