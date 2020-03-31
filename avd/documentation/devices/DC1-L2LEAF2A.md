# DC1-L2LEAF2A

## Management Interfaces

### Management Interfaces Summary

| Management Interface | description | VRF | IP Address | Gateway |
| -------------------- | ----------- | --- | ---------- | ------- |
| Management1 | oob_management | default | 192.168.0.32/24 | 10.33.144.1 |

### Management Interfaces Device Configuration

```eos
interface Management1
   description oob_management
   ip address 192.168.0.32/24
!
```

## Hardware Counters

No Hardware Counters defined

## TerminAttr Daemon

### TerminAttr Daemon Summary

| CV Compression | Ingest gRPC URL | Ingest Authentication Key | Smash Excludes | Ingest Exclude | Ingest VRF |  NTP VRF |
| -------------- | --------------- | ------------------------- | -------------- | -------------- | ---------- | -------- |
| gzip | 192.168.0.5:9910 | 1a38fe7df56879d685e51b6f0ff86327 | ale,flexCounter,hardware,kni,pulse,strata | /Sysdb/cell/1/agent,/Sysdb/cell/2/agent | default | default |

### TerminAttr Daemon Device Configuration

```eos
daemon TerminAttr
   exec /usr/bin/TerminAttr -ingestgrpcurl=192.168.0.5:9910 -cvcompression=gzip -ingestauth=key,1a38fe7df56879d685e51b6f0ff86327 -smashexcludes=ale,flexCounter,hardware,kni,pulse,strata -ingestexclude=/Sysdb/cell/1/agent,/Sysdb/cell/2/agent -ingestvrf=default -taillogs
   no shutdown
!
```

## Internal VLAN allocation Policy

### Internal VLAN Allocation Policy Summary

| Policy Allocation | Range Beginning | Range Ending |
| ------------------| --------------- | ------------ |
| ascending | 1006 | 1199 |

### Internal VLAN Allocation Policy Configuration

```eos
vlan internal order ascending range 1006 1199
!
```

## Name Servers

### Name Servers Summary

| Name Server | Source VRF |
| ----------- | ---------- |
| 192.168.0.4 | default |

### Name Servers Device Configuration

```eos
ip name-server vrf default 192.168.0.4
!
```

## NTP

No NTP servers defined

## Spanning Tree

### Spanning Tree Summary

Mode: mstp

**MSTP Instance and Priority**:

| Instance | Priority |
| -------- | -------- |
| 0 | 16384 |

### Spanning Tree Device Configuration

```eos
spanning-tree mode mstp
spanning-tree mst 0 priority 16384
!
```

## AAA Authentication

AAA Not Configured

## Local Users

### Local Users Summary

| User | Privilege | role |
| ---- | --------- | ---- |
| admin | 15 | network-admin |
| ansible | 15 | network-admin |
| arista | 15 | network-admin |
| cvpadmin | 15 | network-admin |

### Local Users Device Configuration

```eos
username admin privilege 15 role network-admin secret sha512 $6$CHgxxrnu0TYkoxW5$Y7LhIK2afy5lq412359QJALAXf6lulo9.VN22Bx7SiHtsqFcBQTAGM5W7XJEPSIgzY2GDkaNFdQfxc3QFDnM81
username ansible privilege 15 role network-admin secret sha512 $6$Dzu11L7yp9j3nCM9$FSptxMPyIL555OMO.ldnjDXgwZmrfMYwHSr0uznE5Qoqvd9a6UdjiFcJUhGLtvXVZR1r.A/iF5aAt50hf/EK4/
username arista privilege 15 role network-admin secret sha512 $6$YicZOCLhtnxdi$1VcpIqpkCEnPnYpzqFHSXPZbpg6.hf5T9m7ZhdhTOAZ4wwhVk3sb.fkt6578GdAq3D5GuccnQOoOgsiUjLyXJ/
username cvpadmin privilege 15 role network-admin secret sha512 $6$rZKcbIZ7iWGAWTUM$TCgDn1KcavS0s.OV8lacMTUkxTByfzcGlFlYUWroxYuU7M/9bIodhRO7nXGzMweUxvbk8mJmQl8Bh44cRktUj.
!
```

## VLANs

### VLANs Summary

| VLAN ID | Name | Trunk Groups |
| ------- | ---- | ------------ |
| 110 | Tenant_A_OP_Zone_1 | none  |
| 111 | Tenant_A_OP_Zone_2 | none  |
| 112 | Tenant_A_OP_Zone_3 | none  |
| 120 | Tenant_A_WEB_Zone_1 | none  |
| 121 | Tenant_A_WEBZone_2 | none  |
| 130 | Tenant_A_APP_Zone_1 | none  |
| 131 | Tenant_A_APP_Zone_2 | none  |

### VLANs Device Configuration

```eos
vlan 110
   name Tenant_A_OP_Zone_1
!
vlan 111
   name Tenant_A_OP_Zone_2
!
vlan 112
   name Tenant_A_OP_Zone_3
!
vlan 120
   name Tenant_A_WEB_Zone_1
!
vlan 121
   name Tenant_A_WEBZone_2
!
vlan 130
   name Tenant_A_APP_Zone_1
!
vlan 131
   name Tenant_A_APP_Zone_2
!
```

## VRF Instances

### VRF Instances Summary

| VRF Name | IP Routing |
| -------- | ---------- |
| default |  disabled |

### VRF Instances Device Configuration

```eos
```

## BFD Multihop Interval

### BFD Multihop Summary

| Interval | Minimum RX | Multiplier |
| -------- | ---------- | ---------- |
| 1200 | 1200 | 3 |

### BFD Multihop Device Configuration

```eos
bfd multihop interval 1200 min_rx 1200 multiplier 3
!
```

## Port-Channel Interfaces

### Port-Channel Interfaces Summary

| Interface | Description | MTU | Type | Mode | Allowed VLANs (trunk) | Trunk Group | MLAG ID | VRF | IP Address |
| --------- | ----------- | --- | ---- | ---- | --------------------- | ----------- | ------- | --- | ---------- |
| Port-Channel1 | DC1-LEAF2A_Po5 | 1500 | switched | trunk | 110-112,120-121,130-131 | - | 1 | - | - |

### Port-Channel Interfaces Device Configuration

```eos
interface Port-Channel1
   description DC1-LEAF2A_Po5
   switchport trunk allowed vlan 110-112,120-121,130-131
   switchport mode trunk
   mlag 1
!
```

## Ethernet Interfaces

### Ethernet Interfaces Summary

| Interface | Description | MTU | Type | Mode | Allowed VLANs (Trunk) | Trunk Group | VRF | IP Address | Channel-Group ID | Channel-Group Type |
| --------- | ----------- | --- | ---- | ---- | --------------------- | ----------- | --- | ---------- | ---------------- | ------------------ |
| Ethernet1 | DC1-LEAF2A_Ethernet5 | *1500 | *switched | *trunk | *110-112,120-121,130-131 | - | - | - | 1 | active |
| Ethernet2 | DC1-LEAF2B_Ethernet5 | *1500 | *switched | *trunk | *110-112,120-121,130-131 | - | - | - | 1 | active |
| Ethernet5 | server02_Eth0 | 1500 | switched | access | 110 | - | - | - | - | - |

*Inherited from Port-Channel Interface

### Ethernet Interfaces Device Configuration

```eos
interface Ethernet1
   description DC1-LEAF2A_Ethernet5
   channel-group 1 mode active
!
interface Ethernet2
   description DC1-LEAF2B_Ethernet5
   channel-group 1 mode active
!
interface Ethernet5
   description server02_Eth0
   switchport access vlan 110
!
```

## Loopback Interfaces

No Loopback interfaces defined

## VLAN Interfaces

No VLAN interfaces defined

## VXLAN Interface

No VXLAN interface defined

## Virtual Router MAC Address & Virtual Source NAT


## Static Routes

### Static Routes Summary

| VRF | Destination Prefix | Fowarding Address / Interface |
| --- | ------------------ | ----------------------------- |
| default | 0.0.0.0/0 | 10.33.144.1 |

### Static Routes Device Configuration

```eos
ip route vrf default 0.0.0.0/0 10.33.144.1
!
```

## IP Routing

### IP Routing Summary

| VRF | Routing Enabled |
| --- | --------------- |
| default | False |

### IP Routing Device Configuration

```eos
ip routing
!
```

## Prefix Lists

Prefix lists not defined

## MLAG

MLAG not defined

## Route Maps

No route maps defined

## Peer Filters

No Peer Filters defined

## Router BGP

Router BGP not defined
