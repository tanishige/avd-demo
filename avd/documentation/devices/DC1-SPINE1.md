# DC1-SPINE1

## Management Interfaces

### Management Interfaces Summary

| Management Interface | description | VRF | IP Address | Gateway |
| -------------------- | ----------- | --- | ---------- | ------- |
| Management1 | oob_management | default | 192.168.0.10/24 | 10.33.144.1 |

### Management Interfaces Device Configuration

```eos
interface Management1
   description oob_management
   ip address 192.168.0.10/24
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

Mode: none


### Spanning Tree Device Configuration

```eos
spanning-tree mode none
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

No VLANs defined

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

No Port-Channels defined

## Ethernet Interfaces

### Ethernet Interfaces Summary

| Interface | Description | MTU | Type | Mode | Allowed VLANs (Trunk) | Trunk Group | VRF | IP Address | Channel-Group ID | Channel-Group Type |
| --------- | ----------- | --- | ---- | ---- | --------------------- | ----------- | --- | ---------- | ---------------- | ------------------ |
| Ethernet1 | P2P_LINK_TO_DC1-LEAF1A_Ethernet1 | 1500 | routed | access | - | - | - | 172.31.255.0/31 | - | - |
| Ethernet2 | P2P_LINK_TO_DC1-LEAF1B_Ethernet1 | 1500 | routed | access | - | - | - | 172.31.255.4/31 | - | - |
| Ethernet3 | P2P_LINK_TO_DC1-LEAF2A_Ethernet1 | 1500 | routed | access | - | - | - | 172.31.255.8/31 | - | - |
| Ethernet4 | P2P_LINK_TO_DC1-LEAF2B_Ethernet1 | 1500 | routed | access | - | - | - | 172.31.255.12/31 | - | - |

*Inherited from Port-Channel Interface

### Ethernet Interfaces Device Configuration

```eos
interface Ethernet1
   description P2P_LINK_TO_DC1-LEAF1A_Ethernet1
   no switchport
   ip address 172.31.255.0/31
!
interface Ethernet2
   description P2P_LINK_TO_DC1-LEAF1B_Ethernet1
   no switchport
   ip address 172.31.255.4/31
!
interface Ethernet3
   description P2P_LINK_TO_DC1-LEAF2A_Ethernet1
   no switchport
   ip address 172.31.255.8/31
!
interface Ethernet4
   description P2P_LINK_TO_DC1-LEAF2B_Ethernet1
   no switchport
   ip address 172.31.255.12/31
!
```

## Loopback Interfaces

### Loopback Interfaces Summary

| Interface | Description | VRF | IP Address |
| --------- | ----------- | --- | ---------- |
| Loopback0 | EVPN_Overlay_Peering | Global Routing Table | 192.168.255.1/32 |

### Loopback Interfaces Device Configuration

```eos
interface Loopback0
   description EVPN_Overlay_Peering
   ip address 192.168.255.1/32
!
```

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

### Prefix Lists Summary

**PL-LOOPBACKS-EVPN-OVERLAY:**

| Sequence | Action |
| -------- | ------ |
| 10 | permit 192.168.255.0/24 le 32 |

**PL-P2P-UNDERLAY:**

| Sequence | Action |
| -------- | ------ |
| 10 | permit 172.31.255.0/24 le 31 |

### Prefix Lists Device Configuration

```eos
ip prefix-list PL-LOOPBACKS-EVPN-OVERLAY
   seq 10 permit 192.168.255.0/24 le 32
!
ip prefix-list PL-P2P-UNDERLAY
   seq 10 permit 172.31.255.0/24 le 31
!
```

## MLAG

MLAG not defined

## Route Maps

### Route Maps Summary

**RM-CONN-2-BGP:**

| Sequence | Type | Match |
| -------- | ---- | ----- |
| 10 | permit | ip address prefix-list PL-LOOPBACKS-EVPN-OVERLAY |
| 20 | permit | ip address prefix-list PL-P2P-UNDERLAY |

### Route Maps Device Configuration

```eos
route-map RM-CONN-2-BGP permit 10
   match ip address prefix-list PL-LOOPBACKS-EVPN-OVERLAY
!
route-map RM-CONN-2-BGP permit 20
   match ip address prefix-list PL-P2P-UNDERLAY
!
```

## Peer Filters

### Peer Filters Summary

**LEAF-AS-RANGE:**

| Sequence | Match |
| -------- | ----- |
| 10 | as-range 65101-65132 result accept |

### Peer Filters Device Configuration

```eos
peer-filter LEAF-AS-RANGE
   10 match as-range 65101-65132 result accept
!
```

## Router BGP

### Router BGP Summary

| BGP AS | Router ID |
| ------ | --------- |
| 65001|  192.168.255.1 |

| BGP Tuning |
| ---------- |
| no bgp default ipv4-unicast |
| distance bgp 20 200 200 |
| graceful-restart restart-time 300 |
| graceful-restart |
| maximum-paths 2 ecmp 2 |

### Router BGP Peer Groups

**EVPN-OVERLAY-PEERS**:

| Settings | Value |
| -------- | ----- |
| Address Family | evpn |
| next-hop unchanged | True |
| source | Loopback0 |
| bfd | True |
| ebgp multihop | 3 |
| send community | true |
| maximum routes | 0 (no limit) |
**Neighbors:**

| Neighbor | Remote AS |
| -------- | ---------
| 192.168.255.3 | 65101  |
| 192.168.255.4 | 65101  |
| 192.168.255.5 | 65102  |
| 192.168.255.6 | 65102  |

*Inherited from peer group

**IPv4-UNDERLAY-PEERS**:

| Settings | Value |
| -------- | ----- |
| Address Family | ipv4 |
| maximum routes | 12000 |
**Neighbors:**

| Neighbor | Remote AS |
| -------- | ---------
| 172.31.255.1 | 65101  |
| 172.31.255.5 | 65101  |
| 172.31.255.9 | 65102  |
| 172.31.255.13 | 65102  |

*Inherited from peer group

### Router BGP EVPN Address Family

#### Router BGP EVPN MAC-VRFs


#### Router BGP EVPN VRFs


### Router BGP Device Configuration

```eos
router bgp 65001
   router-id 192.168.255.1
   no bgp default ipv4-unicast
   distance bgp 20 200 200
   graceful-restart restart-time 300
   graceful-restart
   maximum-paths 2 ecmp 2
   neighbor EVPN-OVERLAY-PEERS peer group
   neighbor EVPN-OVERLAY-PEERS next-hop-unchanged
   neighbor EVPN-OVERLAY-PEERS update-source Loopback0
   neighbor EVPN-OVERLAY-PEERS bfd
   neighbor EVPN-OVERLAY-PEERS ebgp-multihop 3
   neighbor EVPN-OVERLAY-PEERS password 7 q+VNViP5i4rVjW1cxFv2wA==
   neighbor EVPN-OVERLAY-PEERS send-community
   neighbor EVPN-OVERLAY-PEERS maximum-routes 0
   neighbor IPv4-UNDERLAY-PEERS peer group
   neighbor IPv4-UNDERLAY-PEERS password 7 AQQvKeimxJu+uGQ/yYvv9w==
   neighbor IPv4-UNDERLAY-PEERS maximum-routes 12000
   neighbor 172.31.255.1 peer group IPv4-UNDERLAY-PEERS
   neighbor 172.31.255.1 remote-as 65101
   neighbor 172.31.255.5 peer group IPv4-UNDERLAY-PEERS
   neighbor 172.31.255.5 remote-as 65101
   neighbor 172.31.255.9 peer group IPv4-UNDERLAY-PEERS
   neighbor 172.31.255.9 remote-as 65102
   neighbor 172.31.255.13 peer group IPv4-UNDERLAY-PEERS
   neighbor 172.31.255.13 remote-as 65102
   neighbor 192.168.255.3 peer group EVPN-OVERLAY-PEERS
   neighbor 192.168.255.3 remote-as 65101
   neighbor 192.168.255.4 peer group EVPN-OVERLAY-PEERS
   neighbor 192.168.255.4 remote-as 65101
   neighbor 192.168.255.5 peer group EVPN-OVERLAY-PEERS
   neighbor 192.168.255.5 remote-as 65102
   neighbor 192.168.255.6 peer group EVPN-OVERLAY-PEERS
   neighbor 192.168.255.6 remote-as 65102
   redistribute connected route-map RM-CONN-2-BGP
   !
   address-family evpn
      neighbor EVPN-OVERLAY-PEERS activate
      no neighbor IPv4-UNDERLAY-PEERS activate
   !
   address-family ipv4
      no neighbor EVPN-OVERLAY-PEERS activate
      neighbor IPv4-UNDERLAY-PEERS activate
!
```
