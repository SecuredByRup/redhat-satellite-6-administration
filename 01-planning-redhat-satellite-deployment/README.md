# Lab 1: Planning Red Hat Satellite Deployment

<p align="center">
  <img src="https://img.shields.org/badge/Red_Hat_Enterprise_Linux-EE0000?style=for-the-badge&logo=redhat&logoColor=white" alt="RHEL Logo" />
  <img src="https://img.shields.org/badge/Red_Hat_Satellite-CC0000?style=for-the-badge&logo=redhat&logoColor=white" alt="Satellite Logo" />
  <img src="https://img.shields.org/badge/Bash_Scripting-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white" alt="Bash Logo" />
  <img src="https://img.shields.org/badge/Linux_Security-000000?style=for-the-badge&logo=linux&logoColor=white" alt="Linux Logo" />
</p>

---

## 📌 Executive Summary

This project documents the architectural planning and infrastructure scoping for deploying **Red Hat Satellite 6** across enterprise environments. A successful Satellite deployment requires precise hardware sizing, network port planning, service role segregation (Satellite Server vs. Capsule Servers vs. Content Hosts), lifecycle environment mapping, and deployment phase timelines. 

To streamline this process, custom Bash automation scripts were developed to calculate dynamic storage growth, generate firewall port rules, dynamically construct site assessment worksheets, and compile post-deployment verification checklists.

---

## 🏗️ Architecture & Component Roles

The Red Hat Satellite architecture relies on three primary functional tiers:

| Component | Operational Role | Key Subsystems / Microservices |
| :--- | :--- | :--- |
| **Satellite Server** | Central management & content distribution hub | Katello, Foreman, Candlepin, Pulp, PostgreSQL, MongoDB |
| **Capsule Server** | Distributed regional proxy & local service host | Pulp Node (Content Cache), Smart Proxy (DHCP, DNS, TFTP, Puppet/Ansible) |
| **Content Hosts** | Managed endpoints (Physical, Virtual, Cloud) | Katello Agent, Puppet/Ansible Agent, Subscription Manager |

```
                    [Internet / Red Hat CDN]
                               |
                      [Corporate Firewall]
                               |
                      [Satellite Server]
                       /       |       \
                      /        |        \
              [Capsule 1]  [Capsule 2]  [Capsule 3]
                  |            |            |
           [Content Hosts] [Content Hosts] [Content Hosts]
```

---

## 🛠️ Operational Scripts & Planning Tools

The implementation artifacts are structured in the `scripts/` directory:

* **`storage-calculator.sh`**: Computes base system disk needs, RHEL/third-party repository synchronization overhead, and managed host metadata to output total and padded (+50% buffer) storage requirements.
* **`firewall-config.sh`**: Prints precise `firewall-cmd` rule sets for Satellite web UIs (80/443), Katello agents (5647), Puppet agents (8140), and Capsule services (69/UDP TFTP, 53/TCP/UDP DNS, 67/68 UDP DHCP).
* **`site-assessment.sh`**: Interactively constructs site-specific technical requirement templates for remote office Capsule deployments.
* **`implementation-checklist.sh`**: Generates structured deployment milestones across pre-installation, server setup, content views, capsule rollouts, host migration, and verification phases.

---

## 🔬 Execution Verification & Proof

### 1. Storage Calculation & Firewall Configuration Output

Execution of `storage-calculator.sh` evaluating 5 RHEL repos, 4 third-party repos, and 5 managed hosts (yielding 175 GB total / 262 GB recommended storage buffer), immediately followed by the automated output of `firewall-config.sh`.

![Storage Calculator and Firewall Config](assets/storage_calculator_and_firewall_config.png)

### 2. Site Assessment Generation (`site-assessment.sh`)

Interactive execution of `site-assessment.sh` generating an assessment template for remote site `eagledreams`, validating local infrastructure demands, local provisioning needs, and network bandwidth.

![Site Assessment Generation](assets/site_assessment_and_checklist_execution.png)

---

## 🎯 Conclusion

Lab 1 establishes the fundamental operational roadmap for Red Hat Satellite 6 deployments. By implementing reproducible capacity calculation tools, automated port reference scripts, and structured site evaluation frameworks, enterprise administrators eliminate common deployment pitfalls such as storage exhaustion, firewall bottlenecks, and improper Capsule site selection.