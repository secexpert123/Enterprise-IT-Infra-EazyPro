<#
.SYNOPSIS
    Infrastructure Setup for EazyPro Technologies AB.
.DESCRIPTION
    This script automates the creation of the Organizational Unit (OU) structure 
    and Security Groups for the eazypro.local domain.
#>

# Define the Domain Path
$DomainPath = "DC=eazypro,DC=local"

# 1. Create OUs based on the Network Design
$OUs = @("Management_VLAN80", "Users_VLAN70", "IoT_VLAN30", "Guests_VLAN60")

foreach ($OU in $OUs) {
    if (-not (Get-ADOrganizationalUnit -Filter "Name -eq '$OU'")) {
        New-ADOrganizationalUnit -Name $OU -Path $DomainPath
        Write-Host "Created OU: $OU" -ForegroundColor Green
    }
}

# 2. Create Global Security Groups (IGDLA Model)
New-ADGroup -Name "G_EazyPro_Finance_Read" -GroupScope Global -Path "OU=Users_VLAN70,$DomainPath"
New-ADGroup -Name "G_EazyPro_IT_Admin" -GroupScope Global -Path "OU=Management_VLAN80,$DomainPath"

Write-Host "EazyPro Infrastructure Setup Complete." -ForegroundColor Cyan
