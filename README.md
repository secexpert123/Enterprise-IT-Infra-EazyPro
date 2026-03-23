
This project represents a full-scale IT infrastructure deployment for **EazyPro Technologies AB**, delivered as part of the "Super 8" consultancy team.

## 📊 Project Overview
* **Domain Name:** `eazypro.local`
* **Total Project Value:** 3.42M SEK (Hardware, Installation & Consulting)
* **Environment:** Virtualized Windows Server 2022 environment in Hyper-V.

## 🛠️ Technical Implementation
* **Identity Management:** Configured Active Directory Domain Services (AD DS) with a centralized domain structure.
* **Access Control:** Implemented the **IGDLA** model (Identities, Global Groups, Domain Local Groups, Access) for secure and scalable permission management.
* **Network Segmentation (VLANs):**
    * **VLAN 80:** Management
    * **VLAN 70:** Users
    * **VLAN 30:** IoT & Printers
    * **VLAN 60:** Guests
* **Services Deployed:** DNS Server, DHCP Server, File Server (NTFS), Group Policy (GPO), and Print Services.

## 💻 Automation
The included PowerShell script (`Setup-EazyPro-Core.ps1`) automates the creation of the Organizational Unit (OU) structure and security groups to ensure consistent deployment across the `eazypro.local` environment.

## 🛡️ Support & Maintenance
Designed a 3-tier support workflow (1st, 2nd, and 3rd line) to ensure system reliability and GDPR-aligned data security.
