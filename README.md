# Automation (Enterprise-Grade PowerShell)

## Table of Contents
1. [Project Overview](#project-overview)
2. [Key Automation Features](#key-automation-features)
3. [Script Description](#script-description)
4. [Parameters](#parameters)
5. [Example Usage](#example-usage)
6. [Skills Demonstrated](#skills-demonstrated)

## Project Overview
The infrastructure deployment includes a fully refactored, enterprise‑grade PowerShell automation script:  
**`Setup-EazyPro-Core.ps1`**

This script automates the creation of Organizational Units (OUs) and Security Groups following the IGDLA model.  
It is designed for repeatable, safe, and production‑ready execution in Active Directory environments.

---

## Key Automation Features

- **Modular Functions**  
  Separate functions for OU creation and Security Group creation following best practices.

- **Parameterization**  
  Domain path and log path are passed as parameters, making the script reusable across environments.

- **Logging & Transcript Output**  
  Generates a full transcript log for auditing and troubleshooting.

- **Idempotent Execution**  
  Checks for existing OUs and groups before creating them, ensuring safe re‑runs.

- **Error Handling**  
  Structured `try/catch` blocks for reliable execution in production environments.

- **Active Directory Module Validation**  
  Automatically verifies that the AD module is installed before running.

- **IGDLA Model Implementation**  
  Creates Global Security Groups aligned with enterprise access control standards.

---

## Script Description
This script automates the foundational Active Directory structure for the **EazyPro.local** domain.  
It performs the following tasks:

- Validates that the Active Directory module is installed  
- Starts transcript logging for auditing  
- Creates Organizational Units (OUs) for different VLANs  
- Creates Global Security Groups following the IGDLA model  
- Ensures idempotency by checking for existing objects  
- Provides clear success/error output for each operation  

The script is designed to be safe, repeatable, and suitable for enterprise deployment.

---

## Parameters
The script accepts the following parameters:
.PARAMETER DomainPath
Distinguished Name (DN) of the target domain.
Example: "DC=eazypro,DC=local"

.PARAMETER LogPath
File path for the transcript log.
Default: "C:\Logs\EazyPro-Automation.log"


These parameters allow the script to be reused across multiple AD environments.

---

## Example Usage
.\Setup-EazyPro-Core.ps1 -DomainPath "DC=eazypro,DC=local" -LogPath "C:\Logs\EazyPro.log"

This command:

- Runs the script against the **eazypro.local** domain  
- Saves the transcript log to **C:\Logs\EazyPro.log**  
- Creates OUs and Security Groups automatically 


---

## Skills Demonstrated

| Skill Area          | Technologies Used     | Demonstrated Through                                  |
|---------------------|-----------------------|-------------------------------------------------------|
| Automation          | PowerShell            | Modular functions, idempotent execution               |
| Directory Services  | Active Directory      | OU and Security Group creation                        |
| Logging & Auditing  | Transcript Logging    | Start-Transcript, log file generation                 |
| Access Control Model| IGDLA                 | Global security group design                          |
