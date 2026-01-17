# 💻 Endpoint Auditing: Network & Process Correlation via PowerShell

## 📖 Project Overview
This project demonstrates the use of **Windows PowerShell** for live endpoint auditing. The primary objective was to correlate active network connections with specific system processes to ensure no unauthorized external communication was occurring.

## 🚀 Technical Tasks
- **Network Socket Analysis:** Utilized `netstat -abno` to identify all active TCP/UDP connections.
- **Process ID (PID) Mapping:** Isolated suspicious connections and mapped them to their originating Service or Application using the PID.
- **Elevation of Privilege:** Executed administrative-level queries to inspect protected system threads and services.

## 🔍 Key Findings
- Successfully identified the process responsible for port 443 traffic by cross-referencing PIDs between the terminal and the system's process table.
- Verified that all established connections were originating from verified, signed executables.
