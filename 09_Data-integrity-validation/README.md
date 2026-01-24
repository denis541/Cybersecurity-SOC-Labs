# 🔐 Cryptographic Hash Functions for Data Integrity

![SHA-256](https://img.shields.io/badge/SHA-256-blue)
![Data Integrity](https://img.shields.io/badge/Data-Integrity-green)
![NIST](https://img.shields.io/badge/NIST-FIPS180--4-orange)
![Security](https://img.shields.io/badge/Security-Hashing-red)

---

## 📖 Overview
This module focuses on the implementation of **Cryptographic Hash Functions** to ensure **Data Integrity**.  
By generating a unique digital fingerprint (checksum) of a dataset, we can verify that the information has not been altered, corrupted, or tampered with during transit or storage.

---

## ⚙️ Technical Methodology
- Hashing is a **one-way function**; it is computationally infeasible to reverse a hash to retrieve the original plaintext.  
- This project utilizes the **SHA-2 family**, specifically **SHA-256**, as defined by **NIST FIPS 180-4**.  

---

## 🔑 Key Properties Validated
- **Determinism**: The same input will always produce the identical hash.  
- **Avalanche Effect**: A minor change in input (e.g., changing *“Grandma”* to *“Grandpa”*) results in a significantly different hash, making the change immediately detectable.  
- **Collision Resistance**: It is mathematically improbable for two different inputs to produce the same hash output.  

---

## 🛠️ Implementation & Tooling
Validation is performed using **industry-standard CLI tools**, ensuring compatibility with **Linux/Unix Coreutils**.  

## Manual Verification via OpenSSL
To generate a SHA-256 hash for a specific asset:
```bash
openssl sha256 <filename>
```

## Batch Integrity Checking
In production environments, we use sha256sum to verify files against a provided signature file:
```bash
sha256sum -c sample.img_SHA256.sig
```

A result of OK confirms that the file bitstream is identical to the source.
## Security Observations
Algorithm Depreciation: While MD5 and SHA-1 were historically common, they are now considered cryptographically broken due to Collision Attacks. This repository exclusively utilizes SHA-256 and SHA-512.
Integrity vs. Authenticity: While a hash confirms the file hasn't changed, it does not prove who sent it. For sender verification, Digital Signatures (GPG/PGP) should be implemented alongside hashing.
