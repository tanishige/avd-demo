# LAB 02 - CloudVision Facts

## Initial configuration

> Only if you are running on your own

```shell
$ make configure
```

![](../../imgs/lab02-topology.png)


## Execute lab

__1. Install __`arista.cvp`__ collection__

```shell
# Python requirements
$ pip install treelib
$ pip install requests

# Ansible collection for arista.cvp
$ ansible-galaxy collection install arista.cvp:==1.0.2 -p ../collections
```

__2. Review collection structure__

```shell
$ ls ../collections
```

__3. Read collection documentation__

```shell
$ ansible-doc arista.cvp.cv_facts
```


__4. Collect CV facts__

```shell
$ ansible-playbook playbook.facts.yml
```

__5. Collect specific set of Facts:__

```yaml
# Edit playbook.facts.yml
- name: "Gather CVP facts {{inventory_hostname}}"
    arista.cvp.cv_facts:
    facts:
      device
    gather_subset:
      config
    register: cv_facts
```
