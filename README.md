# Puppet DevOps Lab — Experiment 9

## Installing and Configuring Pull-Based Software Configuration Management and Provisioning Using Puppet

This repository contains the implementation of **DevOps Laboratory Experiment 9** using **Puppet/OpenVox** inside a **GitHub Codespace**.

The experiment demonstrates how a pull-based configuration management system can automatically provision a managed node, maintain its desired state, and correct configuration drift using declarative manifests.

---

## 📌 Experiment Details

| Property | Details |
|---|---|
| Course | DevOps |
| Topic | Pull-Based Software Configuration Management and Provisioning |
| Tool | Puppet / OpenVox |
| Environment | GitHub Codespaces |
| OS | Ubuntu 22.04 |
| Configuration Model | Pull-Based |
| Puppet Server | `puppet` |
| Puppet Agent | `codespace-agent` |
| Agent Run Interval | 2 minutes |
| Puppet Server Port | 8140 |

---

## 🎯 Objective

To install and configure Puppet Server and Puppet Agent and use Puppet to automatically provision a managed node and maintain its desired state using declarative manifests.

The experiment demonstrates:

- Pull-based configuration management
- Puppet Server and Agent architecture
- Certificate-based authentication
- Declarative infrastructure configuration
- Catalog compilation and application
- Package and user provisioning
- File and directory management
- Puppet facts
- Idempotency
- Automatic configuration drift correction
- Self-healing infrastructure

---

# 🏗️ Architecture

The entire experiment is performed inside a single GitHub Codespace.

```text
                    GitHub Repository
                           │
                           ▼
                   GitHub Codespace
                   Ubuntu 22.04
                           │
              ┌────────────┴────────────┐
              │                         │
              ▼                         ▼
        Terminal 1                 Terminal 2
      Puppet Server               Puppet Agent
              │                         │
              │◄──── HTTPS :8140 ──────│
              │                         │
              │       Facts             │
              │◄────────────────────────│
              │                         │
              │       Catalog           │
              │────────────────────────►│
              │                         │
              │                    Apply Catalog
              │                         │
              │                    Desired State
              │                         │
              │              ┌──────────┴──────────┐
              │              │                     │
              │              ▼                     ▼
              │        devopsuser            /opt/devops-lab
              │                                   │
              │                                   ▼
              │                                info.txt
