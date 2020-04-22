---
id: features
title: Core features of DropKit
sidebar_label: Features
---

## Operation history is immutable and trackable

The blockchain-backed audit trail is built-in to ensure each access and each modification of data is securely tracked without the possibility of being deleted or modified. The integrity of data is protected with fraud detection, so that users get notified when anomalous behavior is detected when data access is concerned.

## Per-record encryption

Having data encrypted is nice, but doesn't protect against many types of data breaches. Instead, DropKit encrypts every record separately, using a secure key hierarchy. This serves as effective data breach protection as the risk for breaches is significantly reduced due to the inability to extract large amounts of data at once.

## Fault tolerance

DropKit can automatically handle failures and therefore provides high availability . This means the cluster will remain available for both reads and writes even if one node fails. It is primarily used for applications that support high-value, high-rate transactions, such as check clearinghouses and stock exchanges.

## Ready to use

DropKit can scale horizontally in case user application load increases. It is also highly available and handles encrypted backups automatically. Users simply send SQL-92 compliant statement to specified adapter component and DropKit would maintain accordingly.
