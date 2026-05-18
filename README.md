## Automation (Enterprise-Grade PowerShell)

The infrastructure deployment includes a fully refactored, enterprise‑grade PowerShell automation script:  
**`Setup-EazyPro-Core.ps1`**

### Key Automation Features
The script now includes:

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

### Script Location
