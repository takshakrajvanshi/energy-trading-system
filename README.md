# energy-trading-system
SolarPeer is a blockchain-based P2P energy trading DApp where users trade solar energy using tokens. Smart contracts handle listings and payments, MetaMask signs transactions, and Hardhat provides a local blockchain for testing secure, transparent energy exchange.
# ☀️ SolarPeer – Decentralized Energy Trading DApp

SolarPeer is a blockchain-based peer-to-peer (P2P) energy trading platform that enables users to trade renewable solar energy using smart contracts. The system removes intermediaries and ensures transparent, secure, and automated energy exchange.

---

## 🚀 Project Overview

SolarPeer allows prosumers (energy producers) to list excess solar energy and consumers to purchase it using blockchain tokens.

- ⚡ EnergyToken (SET) → Represents solar energy units
- 💵 MockUSD (mUSD) → Stable payment token
- 🏪 Marketplace → Handles listings, escrow, and trade execution

---

## 🏗️ Architecture

```text
Frontend (HTML + Ethers.js)
        ↓
MetaMask Wallet
        ↓
Hardhat Local Blockchain
        ↓
Smart Contracts
   • EnergyToken
   • MockUSD
   • Marketplace
