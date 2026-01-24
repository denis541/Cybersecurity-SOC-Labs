# 🔐 Public Key Infrastructure (PKI) and Trust Store Analysis

![PKI](https://img.shields.io/badge/PKI-Chain_of_Trust-blue)
![SSL/TLS](https://img.shields.io/badge/SSL-TLS-green)
![CA Store](https://img.shields.io/badge/Certificate-Authority-orange)
![Security](https://img.shields.io/badge/Security-MitM-red)

---

## 📖 Overview
This project explores the fundamental architecture of **Web Trust** by analyzing **Certificate Authority (CA) Stores** and the mechanics of **Man-in-the-Middle (MitM) attacks** via SSL Inspection.  
It demonstrates how endpoint security relies on a **Chain of Trust** and how that trust can be intentionally or maliciously subverted.

---

## ⚙️ Technical Concepts

### 1. The Trust Anchor (CA Store)
Modern operating systems and browsers maintain a **Trusted Root Store**. These are certificates from entities (like DigiCert or Let's Encrypt) that the browser trusts implicitly.

- **Root CA**: The top-level, self-signed certificate.  
- **Intermediate CA**: Certificates signed by the Root to issue end-entity certificates (improving security by keeping the Root offline).  
- **Leaf Certificate**: The actual certificate presented by a website (e.g., *github.com*).  

---

### 2. SSL/TLS Inspection & MitM
An **HTTPS Proxy** or **MitM attack** intercepts the encrypted handshake.  
By injecting a custom Root CA into the victim's Trust Store, an interceptor can generate **on-the-fly certificates** for any domain.

**Result**:  
The browser shows a "Secure" green lock, but the traffic is being decrypted and inspected at the proxy level before being re-encrypted and sent to the destination.

---

## 🧪 Methodology: Detecting Interception
The most reliable way to detect a transparent proxy is through **Fingerprint Verification**.

### Steps for Validation
1. **Retrieve Certificate Fingerprint**: In a clean environment (e.g., mobile device on a cellular network), record the SHA-256 fingerprint of a site's certificate.  
2. **Compare on Target Host**: View the certificate details on the suspected host.  
3. **Identify Discrepancy**: If fingerprints do not match, or if the *Issued By* field points to a corporate entity rather than a known Public CA, an SSL Inspection Proxy is active.  

---

## 🔒 Security Implications
- **Privacy Concerns**:  
  In corporate environments, SSL Inspection allows monitoring for **data exfiltration (DLP)**, but it also exposes sensitive user data (banking, health records) to proxy logs.  

- **Certificate Pinning**:  
  High-security applications use **Certificate Pinning** to hard-code the expected fingerprint, preventing even "trusted" proxies from intercepting traffic.  

---
