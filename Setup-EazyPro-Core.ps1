<#
.SYNOPSIS
    Infrastructure Setup for EazyPro Technologies AB.
.DESCRIPTION
    This script automates the creation of the Organizational Unit (OU) structure 
    and Security Groups for the eazypro.local domain.
    Includes error handling to gracefully manage failures.
#>

# Define the Domain Path
$DomainPath = "DC=eazypro,DC=local"

# 1. Create OUs based on the Network Design
$OUs = @("Management_VLAN80", "Users_VLAN70", "IoT_VLAN30", "Guests_VLAN60")

Write-Host "Starting OU Creation..." -ForegroundColor Cyan

foreach ($OU in $OUs) {
    try {
        $existingOU = Get-ADOrganizationalUnit -Filter "Name -eq '$OU'" -ErrorAction Stop
        Write-Host "OU already exists: $OU" -ForegroundColor Yellow
    }
    catch {
        try {
            New-ADOrganizationalUnit -Name $OU -Path $DomainPath -ErrorAction Stop
            Write-Host "✓ Created OU: $OU" -ForegroundColor Green
        }
        catch {
            Write-Host "✗ ERROR creating OU $OU : $($_.Exception.Message)" -ForegroundColor Red
        }
    }
}

# 2. Create Global Security Groups (IGDLA Model)
Write-Host "`nStarting Security Group Creation..." -ForegroundColor Cyan

$SecurityGroups = @(
    @{ Name = "G_EazyPro_Finance_Read"; Path = "OU=Users_VLAN70,$DomainPath" },
    @{ Name = "G_EazyPro_IT_Admin"; Path = "OU=Management_VLAN80,$DomainPath" }
)

foreach ($Group in $SecurityGroups) {
    try {
        $existingGroup = Get-ADGroup -Filter "Name -eq '$($Group.Name)'" -ErrorAction Stop
        Write-Host "Group already exists: $($Group.Name)" -ForegroundColor Yellow
    }
    catch {
        try {
            New-ADGroup -Name $Group.Name -GroupScope Global -Path $Group.Path -ErrorAction Stop
            Write-Host "✓ Created Group: $($Group.Name)" -ForegroundColor Green
        }
        catch {
            Write-Host "✗ ERROR creating Group $($Group.Name) : $($_.Exception.Message)" -ForegroundColor Red
        }
    }
}

Write-Host "`nEazyPro Infrastructure Setup Complete." -ForegroundColor Cyan
