# LAB 03 - CloudVision Configlets

## Initial configuration

> Only if you are running on your own

```shell
$ make configure
```

![](../../imgs/lab03-topology.png)

## Execute lab

__1. Run configlet playbook__

```shell
$ ansible-playbook playbook.configlet.yml
```

__2. Create a configlet named `TEAMXX-common`__

```yaml
# edit group_vars/CVP.yml
---
CVP_CONFIGLETS:
  STUDENT_DEVICE-alias: "alias a{{ 999 | random }} show version"
  STUDENT_DEVICE-another-configlet: "alias a{{ 999 | random }} show version"
  TEAMXX-common: "{{ lookup('file', 'configlet.txt') }}"

# edit playbook.configlet.yml
- name: "Configure configlet on {{inventory_hostname}}"
    arista.cvp.cv_configlet:
    cvp_facts: "{{CVP_FACTS.ansible_facts}}"
    configlets: "{{CVP_CONFIGLETS}}"
    configlet_filter: ["TEAMXX-common"]
    state: present
    register: CVP_CONFIGLET_RESULT
```

> Change XX by your ID

__3. Display output of __`cv_configlet`__ module__

```yaml
# edit playbook.configlet.yml
- name: 'Display cv_configlet result'
    debug:
    msg: '{{CVP_CONFIGLET_RESULT}}'
```

__4. Remove all created configlet__

```yaml
# edit playbook.configlet.yml
- name: "Configure configlet on {{inventory_hostname}}"
    arista.cvp.cv_configlet:
    cvp_facts: "{{CVP_FACTS.ansible_facts}}"
    configlets: "{{CVP_CONFIGLETS}}"
    configlet_filter: ["TEAMXX-common"]
    state: absent
    register: CVP_CONFIGLET_RESULT
```