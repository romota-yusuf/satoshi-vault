;; Title: SatoshiVault Protocol
;; 
;; Summary: A sophisticated Bitcoin-native DeFi protocol that transforms 
;; STX staking into a multi-tiered reward ecosystem with democratic governance
;;
;; Description: SatoshiVault revolutionizes Bitcoin DeFi by creating a 
;; trustless staking infrastructure where users can lock STX tokens to earn 
;; progressive rewards based on commitment tiers. The protocol features an 
;; innovative governance system that empowers stakeholders to shape the 
;; ecosystem's future through weighted voting mechanisms. Built on Stacks 
;; Layer 2, it ensures Bitcoin-level security while enabling sophisticated 
;; DeFi operations including flexible lock periods, automatic reward 
;; compounding, and emergency safeguards for maximum capital protection.
;;

;; TOKEN DEFINITIONS & CORE CONSTANTS

;; Protocol native governance token
(define-fungible-token SATOSHIVAULT-TOKEN u0)

;; Contract administration principal
(define-constant CONTRACT-OWNER tx-sender)

;; ERROR CONSTANTS

(define-constant ERR-NOT-AUTHORIZED (err u1000))
(define-constant ERR-INVALID-PROTOCOL (err u1001))
(define-constant ERR-INVALID-AMOUNT (err u1002))
(define-constant ERR-INSUFFICIENT-STX (err u1003))
(define-constant ERR-COOLDOWN-ACTIVE (err u1004))
(define-constant ERR-NO-STAKE (err u1005))
(define-constant ERR-BELOW-MINIMUM (err u1006))
(define-constant ERR-PAUSED (err u1007))

;; PROTOCOL STATE VARIABLES

;; Protocol control mechanisms
(define-data-var contract-paused bool false)
(define-data-var emergency-mode bool false)
(define-data-var stx-pool uint u0)

;; Staking configuration parameters
(define-data-var base-reward-rate uint u500)      ;; 5% base rate (100 = 1%)
(define-data-var bonus-rate uint u100)            ;; 1% bonus for longer staking
(define-data-var minimum-stake uint u1000000)     ;; Minimum stake: 1 STX
(define-data-var cooldown-period uint u1440)      ;; 24 hour cooldown in blocks
(define-data-var proposal-count uint u0)

;; DATA STRUCTURE DEFINITIONS

;; Governance proposal registry
(define-map Proposals
  { proposal-id: uint }
  {
    creator: principal,
    description: (string-utf8 256),
    start-block: uint,
    end-block: uint,
    executed: bool,
    votes-for: uint,
    votes-against: uint,
    minimum-votes: uint,
  }
)

;; Comprehensive user account management
(define-map UserPositions
  principal
  {
    total-collateral: uint,
    total-debt: uint,
    health-factor: uint,
    last-updated: uint,
    stx-staked: uint,
    analytics-tokens: uint,
    voting-power: uint,
    tier-level: uint,
    rewards-multiplier: uint,
  }
)

;; Individual staking position tracking
(define-map StakingPositions
  principal
  {
    amount: uint,
    start-block: uint,
    last-claim: uint,
    lock-period: uint,
    cooldown-start: (optional uint),
    accumulated-rewards: uint,
  }
)