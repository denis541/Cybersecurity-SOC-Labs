# 07. Defensive Control: Incident Containment via ACLs 🛡️
[![SOC](https://img.shields.io/badge/SOC-Active-blue?logo=security)](#)
[![Monitoring](https://img.shields.io/badge/24%2F7-Monitoring-critical?logo=clockify)](#)
[![Incident Response](https://img.shields.io/badge/Incident%20Response-Ready-red?logo=alert)](#)
[![Threat Detection](https://img.shields.io/badge/Threat%20Detection-Enabled-brightgreen?logo=radar)](#)
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
