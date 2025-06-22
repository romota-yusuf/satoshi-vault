# SatoshiVault Protocol

> **A sophisticated Bitcoin-native DeFi protocol that transforms STX staking into a multi-tiered reward ecosystem with democratic governance**

[![Stacks](https://img.shields.io/badge/Built%20on-Stacks-5546FF)](https://stacks.co)
[![Bitcoin](https://img.shields.io/badge/Secured%20by-Bitcoin-F7931A)](https://bitcoin.org)

## 🚀 Overview

SatoshiVault revolutionizes Bitcoin DeFi by creating a trustless staking infrastructure where users can lock STX tokens to earn progressive rewards based on commitment tiers. Built on Stacks Layer 2, it ensures Bitcoin-level security while enabling sophisticated DeFi operations including flexible lock periods, automatic reward compounding, and emergency safeguards for maximum capital protection.

### Key Features

- **🏆 Multi-Tier Reward System**: Bronze, Silver, and Gold tiers with escalating benefits
- **🗳️ Democratic Governance**: Weighted voting system for protocol evolution
- **⏰ Flexible Lock Periods**: Choose your commitment level (no lock, 1 month, 2 months)
- **🛡️ Security First**: Emergency pause mechanisms and cooldown periods
- **📊 Transparent Analytics**: Real-time tracking of positions and rewards

## 📋 System Overview

SatoshiVault operates as a comprehensive staking and governance protocol that manages user deposits, calculates rewards based on tier levels and lock periods, and facilitates community-driven decision making through proposal-based governance.

### Core Components

1. **Staking Engine**: Manages STX deposits and reward calculations
2. **Tier System**: Progressive reward multipliers based on stake amounts
3. **Governance Module**: Proposal creation and weighted voting mechanism
4. **Security Layer**: Emergency controls and withdrawal safeguards

## 🏗️ Contract Architecture

```
SatoshiVault Protocol
├── Token Management
│   └── SATOSHIVAULT-TOKEN (Governance Token)
├── State Management
│   ├── Protocol Controls (pause/emergency)
│   ├── Staking Parameters (rates, minimums, cooldowns)
│   └── Proposal Tracking
├── Data Structures
│   ├── UserPositions (comprehensive account data)
│   ├── StakingPositions (individual stake tracking)
│   ├── Proposals (governance proposals)
│   └── TierLevels (reward tier configuration)
├── Core Functions
│   ├── Staking Operations
│   │   ├── stake-stx()
│   │   ├── initiate-unstake()
│   │   └── complete-unstake()
│   ├── Governance Operations
│   │   ├── create-proposal()
│   │   └── vote-on-proposal()
│   └── Administration
│       ├── initialize-contract()
│       ├── pause-contract()
│       └── resume-contract()
└── Utility Functions
    ├── Tier Calculation
    ├── Reward Computation
    └── Validation Helpers
```

## 🔄 Data Flow

### Staking Flow

```
User Stake Request
    ↓
Validation (amount, lock period, contract status)
    ↓
STX Transfer to Contract
    ↓
Tier Calculation (based on total stake)
    ↓
Position Update (user data, staking records)
    ↓
Pool Update (global STX pool tracking)
    ↓
Return Success/Error
```

### Unstaking Flow

```
Initiate Unstake Request
    ↓
Validation (sufficient stake, no active cooldown)
    ↓
Start Cooldown Period (24 hours)
    ↓
Complete Unstake (after cooldown)
    ↓
STX Transfer Back to User
    ↓
Position Cleanup
```

### Governance Flow

```
Proposal Creation
    ↓
Validation (voting power, description, period)
    ↓
Proposal Registration
    ↓
Community Voting (weighted by stake)
    ↓
Vote Tallying
    ↓
Proposal Resolution
```

## 💰 Tier System

| Tier | Minimum Stake | Reward Multiplier | Features |
|------|---------------|-------------------|----------|
| 🥉 Bronze | 1 STX | 1.0x | Basic staking |
| 🥈 Silver | 5 STX | 1.5x | Enhanced rewards + governance |
| 🥇 Gold | 10 STX | 2.0x | Premium features + priority access |

### Lock Period Multipliers

- **No Lock**: 1.0x multiplier
- **1 Month Lock**: 1.25x multiplier  
- **2 Month Lock**: 1.5x multiplier

## 🛠️ Technical Specifications

### Smart Contract Details

- **Language**: Clarity
- **Network**: Stacks Mainnet
- **Base Reward Rate**: 5% APR
- **Minimum Stake**: 1 STX (1,000,000 µSTX)
- **Cooldown Period**: 24 hours (1,440 blocks)

### Error Codes

- `u1000`: Not authorized
- `u1001`: Invalid protocol parameters
- `u1002`: Invalid amount
- `u1003`: Insufficient STX
- `u1004`: Cooldown period active
- `u1005`: No active stake
- `u1006`: Below minimum stake
- `u1007`: Contract paused

## 🚀 Getting Started

### Prerequisites

- Stacks wallet (Hiro, Xverse, etc.)
- STX tokens for staking
- Basic understanding of DeFi concepts

### Deployment

1. Deploy the contract to Stacks network
2. Initialize tier levels and parameters
3. Set appropriate governance thresholds
4. Enable staking operations

### Integration

```clarity
;; Stake STX with 1-month lock period
(contract-call? .satoshivault-protocol stake-stx u5000000 u4320)

;; Check user position
(contract-call? .satoshivault-protocol get-user-position tx-sender)

;; Create governance proposal
(contract-call? .satoshivault-protocol create-proposal 
  u"Increase base reward rate to 6%" u1440)
```

## 🔒 Security Features

- **Emergency Pause**: Admin can halt all operations if needed
- **Withdrawal Cooldown**: 24-hour delay prevents flash loan attacks
- **Input Validation**: Comprehensive parameter checking
- **Access Controls**: Role-based permissions for critical functions

## 🗳️ Governance

SatoshiVault implements a democratic governance system where:

- Voting power is proportional to staked amount
- Minimum 1 STX staked required to create proposals
- Proposals have configurable voting periods (100-2880 blocks)
- Community decides protocol upgrades and parameter changes

## 📊 Analytics & Monitoring

The protocol tracks comprehensive metrics including:

- Total STX pool size
- Individual user positions and tiers
- Reward accumulation and distribution
- Governance participation rates
- Protocol utilization statistics

## 🤝 Contributing

We welcome contributions from the community! Please read our contributing guidelines and submit pull requests for:

- Bug fixes and optimizations
- Feature enhancements
- Documentation improvements
- Security audits
