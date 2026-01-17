# 🔍 Windows Endpoint Analysis: Process & Thread Investigation

![Security](https://img.shields.io/badge/security-passed-brightgreen)
![Tool](https://img.shields.io/badge/tool-active-blue)

## 📖 Executive Summary
This project focuses on **Host-Based Analysis** by investigating active system processes and threads. Using the **Microsoft Sysinternals Process Explorer**, I analyzed the internal architecture of a Windows environment to distinguish between legitimate system operations and user-initiated activities—a foundational skill for **Threat Hunting** and **Incident Response**.

## 🚀 Technical Implementation

### 1. Process Hierarchy & Tree Analysis
- Deployed **Process Explorer** to gain a hierarchical view of running applications.
- **Critical Finding:** Analyzed the **Parent-Child relationship** of system processes (e.g., `services.exe` spawning various `svchost.exe` instances). 
- *Security Insight:* Identifying "orphan" processes (those without a legitimate parent) is a key indicator of malware persistence.

### 2. Deep-Dive: System Process Validation (`lsass.exe`)
- Conducted a forensic audit of the **Local Security Authority Subsystem Service**.
- **Validation Check:** Confirmed the executable path is `C:\Windows\System32\lsass.exe`.
- **Finding:** Verified that only a single instance of `lsass.exe` was running, as multiple instances or incorrect file paths often signal a **Masquerading Attack**.

### 3. User-Mode Process Exploration
- **Scenario:** Initiated a web browser (Microsoft Edge/Firefox) and tracked its execution.
- **Dynamic Observation:** Observed the creation of multiple threads and handles under the main browser process.
- **Resource Analysis:** Utilized the tool to identify the specific **DLLs (Dynamic Link Libraries)** and handles currently in use by the browser, simulating a memory forensics workflow.

## 💻 Technical Reference
| Operation | Forensic Objective |
| :--- | :--- |
| **Tree View** | Map process lineage and detect unauthorized spawns. |
| **Verify Image Path** | Detect "Masquerading" where malware mimics system filenames. |
| **Handle Search** | Identify which files or registry keys are locked by a process. |
| **Thread Inspection** | Analyze individual execution paths for suspicious CPU spikes. |

## 📊 Visual Evidence
![Process Explorer Hierarchy](./screenshots/process-tree-view.png)
*Figure 1: Analysis of the Windows process tree and legitimate system service lineage.*

---
*This implementation is part of my **CyberOps Associate** security portfolio.*
