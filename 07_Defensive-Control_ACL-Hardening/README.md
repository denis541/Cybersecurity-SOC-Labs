# 07. Defensive Control: Incident Containment via ACLs 🛡️
![Packet Tracer](https://img.shields.io/badge/Cisco-Packet%20Tracer-1BA0D7?logo=cisco)
![Cisco Networking](https://img.shields.io/badge/Cisco-Networking-blue?logo=cisco)
![Network Security](https://img.shields.io/badge/Network%20Security-Enabled-green?logo=shield)
![Firewall](https://img.shields.io/badge/Firewall-Configured-red?logo=firefoxbrowser)
![ACL Rules](https://img.shields.io/badge/ACL%20Rules-Active-orange?logo=list)
![Firewall Policy](https://img.shields.io/badge/Firewall%20Policy-Enforced-critical?logo=security)
![Access Control](https://img.shields.io/badge/Access%20Control-ACL%20Rules-yellow?logo=lock)

## 📝 Project Overview
This lab demonstrates the implementation of **Network Access Control Lists (ACLs)** to enforce security boundaries and contain potential lateral movement. By configuring standard IPv4 ACLs, I successfully isolated a specific network segment, simulating a response to an unauthorized traffic discovery.

## 🎯 SOC Objective
In a SOC environment, Analysts must understand how to decommission or restrict network paths during the **Containment** phase of an incident. This project validates my ability to:
- Identify unauthorized communication paths.
- Translate security policies into router-level configuration.
- Validate the effectiveness of hardware-level defensive controls.

## 🛠️ Technology Stack
- **Simulator**: Cisco Packet Tracer
- **Platform**: Cisco IOS (CLI)
- **Protocols**: ICMP, IPv4
- **Security Control**: Standard Numbered ACLs (List 11)

## 🔍 Implementation Detail
### Policy Requirement
The security policy required that the `192.168.10.0/24` subnet be prevented from accessing remote resources (DNS Server/Remote PC4) while maintaining internal communication for local services.

### Configuration Applied
```bash
R1# show access-lists
Standard IP access list 11
    10 deny  192.168.10.0 0.0.0.255  # Containment of local subnet
    20 permit any                    # Allowing authorized global traffic
