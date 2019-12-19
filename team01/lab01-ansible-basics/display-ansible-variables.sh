#!/bin/sh

ansible $1 -m debug -a "var=hostvars[inventory_hostname]" -i inventory.yml