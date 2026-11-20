# VERICRED — Verify Without Revealing
### Web3 Decentralized Academic Credentials with Zero-Knowledge Selective Disclosure

**Team**: FET’S LUCK (Atreya Nandy, Soumallya Naskar, Raj Barman, Smarto Mukherjee)  
**Track**: Web3 (Blockchain) | HACK <N> PITCH • E-SUMMIT '26 (Jadavpur University)

---

## 💡 Overview

Current academic credential verification takes weeks, marksheets can be forged, and sharing full transcripts exposes students' private grades and academic histories.

**VERICRED** solves this using an end-to-end Web3 architecture:
1. **Institution Portal**: Universities cryptographically sign degree credentials and register the hash fingerprint on the public blockchain (testnet). Degrees can be revoked in real time.
2. **Student Wallet**: Students store their credentials privately in a client-side wallet.
3. **Selective Disclosure via Zero-Knowledge Proof (ZKP)**: Students can mathematically prove a claim (e.g. `CGPA ≥ 8.0`) without revealing their actual CGPA (e.g. `8.70`), course-wise grades, or full transcript.
4. **Verifier Portal**: Employers and universities scan a QR code to verify the degree in seconds (checking issuer authenticity, on-chain revocation status, and ZK mathematical validity).

> **Core Privacy Guarantee**: The public blockchain stores **NO personal data**. Only the cryptographic fingerprint (`bytes32` hash) and valid/revoked status flags are stored on-chain.

---

## 📁 Project Architecture

```
vericred/
├── contracts/
│   ├── IssuerRegistry.sol          # Smart contract whitelist of accredited universities
│   └── CredentialRegistry.sol      # On-chain registry for credential fingerprints & live status
├── src/
│   ├── crypto/
│   │   ├── credentialSchema.js     # Standardized JSON Verifiable Credential schema & blinding salt
│   │   ├── signer.js               # Keccak-256/SHA-256 fingerprinting & digital signatures
│   │   └── zkpEngine.js            # Zero-Knowledge Schnorr/Fiat-Shamir range proof engine
│   ├── services/
│   │   ├── blockchainService.js    # Interface to EVM testnet & local persistent ledger
│   │   └── mockData.js             # Realistic demo profiles (FET'S LUCK team members)
│   ├── app.js                      # Application controller orchestrating UI, crypto & Web3
│   └── styles.css                  # Custom styles and glassmorphism touches
├── index.html                      # Unified responsive single-page portal
└── package.json                    # Project configuration
```

---

## 🚀 How to Run

1. Open `index.html` directly in any web browser (Chrome, Brave, Edge, Opera GX):
   ```powershell
   Start-Process "D:\C LEARNING\vericred\index.html"
   ```
2. Or run with any local dev server (e.g. Vite or Python HTTP server):
   ```powershell
   npx vite
   ```

---

## 🏆 Presentation Demo Guide (For Judges & Pitching)

### Scenario A: The Core ZKP Flow (Selective Disclosure)
1. Navigate to **Student Wallet (ZKP)** tab.
2. Notice student **Atreya Nandy** has an actual CGPA of **8.70** (marked 🔒 Private).
3. Select claim: `CGPA ≥ 8.0`. Click **"Create Zero-Knowledge Proof & QR"**.
4. Click **"Send Directly to Verifier Portal"**.
5. Click **"Verify Claim in Seconds"**.
6. **Result**: All 3 security pipeline checks pass with green badges:
   - ✓ Authorized Academic Issuer (Jadavpur University)
   - ✓ CredentialRegistry On-Chain Status (Valid)
   - ✓ Zero-Knowledge Proof Evaluation (Mathematically Valid)
   - **Verdict**: The employer knows the student has `CGPA ≥ 8.0` with 100% mathematical certainty, while the actual `8.70` is **never revealed**!

### Scenario B: Instant Degree Revocation
1. Go to **Institution Portal**.
2. Under "Issued Credentials Registry", click **"🚨 Revoke Degree"** on Atreya's degree.
3. Switch back to **Verifier Portal** and re-run verification.
4. **Result**: Instantly **REJECTED**: Credential has been revoked on the public blockchain!
