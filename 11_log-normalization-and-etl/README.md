# Log Normalization and Temporal Data Transformation
![Security Analysis](https://img.shields.io/badge/Security-Analysis-blue)
![Log Normalization](https://img.shields.io/badge/Log-Normalization-green)
![CIA Triad Complete](https://img.shields.io/badge/CIA%20Triad-Complete-brightgreen)
![Built with AWK](https://img.shields.io/badge/Built%20with-AWK-orange)
![SIEM Ready](https://img.shields.io/badge/SIEM-Ready-red)
## Overview
This module demonstrates the process of Data Normalization, a critical phase in security telemetry analysis. Security events originate from diverse sources (firewalls, web servers, applications), each utilizing unique syntax and timestamp formats. To perform effective Cross-Log Correlation, these data points must be converted into a universal, human-readable format.

## Technical Objectives
Temporal Standardization: Convert high-precision Unix Epoch timestamps (seconds since 1970-01-01) into ISO-8601 or human-readable formats for forensic investigation.

Field Delimitation: Handle non-standard delimiters (e.g., Pipe | vs. Comma ,) to ensure data structure integrity.

Data Sanitization: Identify and remove null entries or trailing whitespace that can cause "Epoch 0" errors (e.g., Dec 31 1969 artifacts).

### Tools and Implementation
The primary tool utilized for this transformation is AWK, a specialized data-driven programming language for text processing.

### Epoch to Human-Readable Conversion
The following logic is used to parse delimited log files and rewrite the temporal field:

```bash
awk 'BEGIN {FS=OFS="|"} {$3=strftime("%c",$3)} {print}' application_raw.log
```
## Key components:

FS/OFS: Defines the Input and Output Field Separators.

strftime: An internal function used to cast the integer Epoch value into a standardized string.

$3: Specifically targets the third column, preserving the integrity of surrounding metadata.

### Use Cases in Security Operations
Incident Timeline Construction: Aligning logs from an Apache web server with Linux system logs to trace an attacker's lateral movement.

SIEM Ingestion: Preparing raw data for ingestion into platforms like Security Onion or Elasticsearch, which require consistent timestamp formats to index events correctly.

Anomaly Detection: Facilitating mathematical operations on time (e.g., calculating the duration between a login event and a sensitive file access).

## Operational Notes
The "1969" Artifact
During the lab, an empty trailing line resulted in a timestamp of Dec 31, 1969. This is a classic "null value" error where a value of 0 or null is interpreted as the start of the Unix Epoch. Professional ETL pipelines must include logic to drop or ignore these malformed entries.

## Summary of Your Portfolio
By including all four labs, your repository now covers the full Cybersecurity Data Lifecycle:

## Pillar	Implementation
Confidentiality	AES Encryption
Integrity	SHA-256 Hashing
Trust/Identity	PKI & CA Stores
Visibility/Analysis	Log Normalization
