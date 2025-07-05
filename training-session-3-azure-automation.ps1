# PowerShell Training Session 3: Azure Automation & Cloud Management
# Master Azure PowerShell for Cloud Automation 🚀☁️

Write-Host "=== AZURE POWERSHELL AUTOMATION TRAINING ===" -ForegroundColor Cyan
Write-Host "Session 3: Azure Cloud Management & Enterprise Automation" -ForegroundColor Yellow
Write-Host "Trainer: Your AI PowerShell Coach" -ForegroundColor Green

# ===== LESSON 1: AZURE POWERSHELL SETUP =====
Write-Host "`n--- LESSON 1: Setting Up Azure PowerShell ---" -ForegroundColor Magenta

Write-Host "🎯 TRAINER TIP: Azure PowerShell is your gateway to cloud automation!" -ForegroundColor Green

function Install-AzureModules {
    Write-Host "Installing Azure PowerShell modules..." -ForegroundColor Yellow
    
    # Check if running as administrator
    $isAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
    
    if ($isAdmin) {
        Write-Host "✅ Running as Administrator - Installing modules..." -ForegroundColor Green
        
        # Install Azure PowerShell modules
        $modules = @("Az.Accounts", "Az.Resources", "Az.Storage", "Az.KeyVault", "Az.Automation", "Az.Monitor", "Az.Profile")
        
        foreach ($module in $modules) {
            Write-Host "Installing $module..." -ForegroundColor Yellow
            # Install-Module -Name $module -AllowClobber -Force -Scope CurrentUser
            Write-Host "  ✅ $module installed (simulated)" -ForegroundColor Green
        }
    } else {
        Write-Host "⚠️  Not running as Administrator - modules will be installed for current user only" -ForegroundColor Yellow
        Write-Host "Command to install: Install-Module -Name Az -AllowClobber -Force -Scope CurrentUser" -ForegroundColor Cyan
    }
    
    Write-Host "✅ Azure modules installation complete!" -ForegroundColor Green
}

Write-Host "`n🏋️ EXERCISE 1: Install Azure PowerShell modules" -ForegroundColor Green
Install-AzureModules

# ===== LESSON 2: AZURE AUTHENTICATION =====
Write-Host "`n--- LESSON 2: Azure Authentication & Connection ---" -ForegroundColor Magenta

Write-Host "🎯 TRAINER TIP: Secure authentication is crucial for cloud automation!" -ForegroundColor Green

function Connect-ToAzure {
    param(
        [string]$SubscriptionId,
        [string]$TenantId
    )
    
    Write-Host "Connecting to Azure..." -ForegroundColor Yellow
    
    # Simulated connection - in real scenario, this would prompt for authentication
    Write-Host "Command to connect: Connect-AzAccount" -ForegroundColor Cyan
    Write-Host "For automation: Connect-AzAccount -ServicePrincipal -TenantId $TenantId -Credential \$cred" -ForegroundColor Cyan
    
    # Simulated Azure context
    $azureContext = @{
        Account = "user@company.com"
        Subscription = "Production Subscription"
        TenantId = "12345678-1234-1234-1234-123456789012"
        Environment = "AzureCloud"
    }
    
    Write-Host "✅ Connected to Azure!" -ForegroundColor Green
    Write-Host "Account: $($azureContext.Account)" -ForegroundColor Yellow
    Write-Host "Subscription: $($azureContext.Subscription)" -ForegroundColor Yellow
    Write-Host "Tenant: $($azureContext.TenantId)" -ForegroundColor Yellow
    
    return $azureContext
}

Write-Host "`n🏋️ EXERCISE 2: Connect to Azure" -ForegroundColor Green
$azContext = Connect-ToAzure

# ===== LESSON 3: RESOURCE GROUP MANAGEMENT =====
Write-Host "`n--- LESSON 3: Resource Group Management ---" -ForegroundColor Magenta

Write-Host "🎯 TRAINER TIP: Resource groups are containers for your Azure resources!" -ForegroundColor Green

function Manage-ResourceGroups {
    param([string]$Action = "List")
    
    switch ($Action) {
        "List" {
            Write-Host "Listing Resource Groups..." -ForegroundColor Yellow
            
            # Simulated resource groups
            $resourceGroups = @(
                @{Name="rg-production-web"; Location="East US"; Status="Succeeded"},
                @{Name="rg-development-api"; Location="West US"; Status="Succeeded"},
                @{Name="rg-backup-storage"; Location="Central US"; Status="Succeeded"}
            )
            
            Write-Host "Found $($resourceGroups.Count) resource groups:" -ForegroundColor Green
            foreach ($rg in $resourceGroups) {
                Write-Host "  📁 $($rg.Name) - $($rg.Location) - $($rg.Status)" -ForegroundColor Cyan
            }
        }
        
        "Create" {
            $rgName = "rg-powershell-training"
            $location = "East US"
            
            Write-Host "Creating Resource Group: $rgName" -ForegroundColor Yellow
            Write-Host "Command: New-AzResourceGroup -Name '$rgName' -Location '$location'" -ForegroundColor Cyan
            Write-Host "✅ Resource Group created (simulated)" -ForegroundColor Green
        }
        
        "Delete" {
            $rgName = "rg-powershell-training"
            Write-Host "⚠️  Deleting Resource Group: $rgName" -ForegroundColor Red
            Write-Host "Command: Remove-AzResourceGroup -Name '$rgName' -Force" -ForegroundColor Cyan
            Write-Host "✅ Resource Group deleted (simulated)" -ForegroundColor Green
        }
    }
}

Write-Host "`n🏋️ EXERCISE 3: Manage Resource Groups" -ForegroundColor Green
Manage-ResourceGroups -Action "List"
Manage-ResourceGroups -Action "Create"

# ===== LESSON 4: VIRTUAL MACHINE AUTOMATION =====
Write-Host "`n--- LESSON 4: Virtual Machine Automation ---" -ForegroundColor Magenta

Write-Host "🎯 TRAINER TIP: Automate VM deployment and management for scalability!" -ForegroundColor Green

function New-AzureVM {
    param(
        [string]$ResourceGroupName = "rg-powershell-training",
        [string]$VMName = "vm-web-server",
        [string]$Location = "East US",
        [string]$VMSize = "Standard_B2s"
    )
    
    Write-Host "Creating Azure Virtual Machine..." -ForegroundColor Yellow
    Write-Host "VM Name: $VMName" -ForegroundColor Cyan
    Write-Host "Resource Group: $ResourceGroupName" -ForegroundColor Cyan
    Write-Host "Location: $Location" -ForegroundColor Cyan
    Write-Host "Size: $VMSize" -ForegroundColor Cyan
    
    # Simulated VM creation process
    Write-Host "1. Creating virtual network..." -ForegroundColor Yellow
    Write-Host "2. Creating public IP..." -ForegroundColor Yellow
    Write-Host "3. Creating network security group..." -ForegroundColor Yellow
    Write-Host "4. Creating network interface..." -ForegroundColor Yellow
    Write-Host "5. Creating virtual machine..." -ForegroundColor Yellow
    
    # PowerShell commands for VM creation
    Write-Host "`nPowerShell commands for VM creation:" -ForegroundColor Magenta
    Write-Host "New-AzVm -ResourceGroupName '$ResourceGroupName' -Name '$VMName' -Location '$Location' -VirtualNetworkName 'vnet-web' -SubnetName 'subnet-web' -SecurityGroupName 'nsg-web' -PublicIpAddressName 'pip-web' -Size '$VMSize'" -ForegroundColor Cyan
    
    Write-Host "✅ Virtual Machine created successfully (simulated)" -ForegroundColor Green
    
    # Return VM information
    $vmInfo = @{
        Name = $VMName
        ResourceGroup = $ResourceGroupName
        Location = $Location
        Size = $VMSize
        Status = "Running"
        PublicIP = "20.42.123.45"
        PrivateIP = "10.0.0.4"
    }
    
    return $vmInfo
}

function Get-AzureVMStatus {
    Write-Host "Checking VM Status..." -ForegroundColor Yellow
    
    # Simulated VMs
    $vms = @(
        @{Name="vm-web-server"; Status="Running"; Location="East US"},
        @{Name="vm-api-server"; Status="Stopped"; Location="West US"},
        @{Name="vm-database"; Status="Running"; Location="Central US"}
    )
    
    Write-Host "Virtual Machine Status Report:" -ForegroundColor Green
    Write-Host "=============================" -ForegroundColor Green
    
    foreach ($vm in $vms) {
        $statusColor = if ($vm.Status -eq "Running") { "Green" } else { "Red" }
        Write-Host "🖥️  $($vm.Name): $($vm.Status) - $($vm.Location)" -ForegroundColor $statusColor
    }
}

Write-Host "`n🏋️ EXERCISE 4: VM Management" -ForegroundColor Green
$vmInfo = New-AzureVM
Get-AzureVMStatus

# ===== LESSON 5: STORAGE ACCOUNT AUTOMATION =====
Write-Host "`n--- LESSON 5: Storage Account Automation ---" -ForegroundColor Magenta

Write-Host "🎯 TRAINER TIP: Automate storage for scalable data management!" -ForegroundColor Green

function New-AzureStorageAccount {
    param(
        [string]$ResourceGroupName = "rg-powershell-training",
        [string]$StorageAccountName = "stpowershelltraining",
        [string]$Location = "East US",
        [string]$SkuName = "Standard_LRS"
    )
    
    Write-Host "Creating Azure Storage Account..." -ForegroundColor Yellow
    Write-Host "Storage Account: $StorageAccountName" -ForegroundColor Cyan
    Write-Host "Resource Group: $ResourceGroupName" -ForegroundColor Cyan
    Write-Host "Location: $Location" -ForegroundColor Cyan
    Write-Host "SKU: $SkuName" -ForegroundColor Cyan
    
    # PowerShell command for storage account creation
    Write-Host "`nPowerShell command:" -ForegroundColor Magenta
    Write-Host "New-AzStorageAccount -ResourceGroupName '$ResourceGroupName' -Name '$StorageAccountName' -Location '$Location' -SkuName '$SkuName'" -ForegroundColor Cyan
    
    Write-Host "✅ Storage Account created successfully (simulated)" -ForegroundColor Green
    
    # Create blob containers
    $containers = @("web-content", "backups", "logs", "documents")
    
    Write-Host "Creating blob containers..." -ForegroundColor Yellow
    foreach ($container in $containers) {
        Write-Host "  📦 Creating container: $container" -ForegroundColor Cyan
        # New-AzStorageContainer -Name $container -Permission Blob
    }
    
    Write-Host "✅ Blob containers created" -ForegroundColor Green
}

function Backup-ToAzureStorage {
    param(
        [string]$LocalPath = "C:\ImportantData",
        [string]$StorageAccountName = "stpowershelltraining",
        [string]$ContainerName = "backups"
    )
    
    Write-Host "Backing up data to Azure Storage..." -ForegroundColor Yellow
    
    # Simulated file upload
    $files = @("database.bak", "config.xml", "user-data.csv")
    
    foreach ($file in $files) {
        Write-Host "  📤 Uploading $file..." -ForegroundColor Cyan
        # Set-AzStorageBlobContent -File "$LocalPath\$file" -Container $ContainerName -Blob $file
        Write-Host "  ✅ $file uploaded successfully" -ForegroundColor Green
    }
    
    Write-Host "✅ Backup completed to Azure Storage" -ForegroundColor Green
}

Write-Host "`n🏋️ EXERCISE 5: Storage Management" -ForegroundColor Green
New-AzureStorageAccount
Backup-ToAzureStorage

# ===== LESSON 6: AZURE AUTOMATION ACCOUNTS =====
Write-Host "`n--- LESSON 6: Azure Automation Accounts ---" -ForegroundColor Magenta

Write-Host "🎯 TRAINER TIP: Azure Automation runs your PowerShell scripts in the cloud!" -ForegroundColor Green

function New-AzureAutomationAccount {
    param(
        [string]$ResourceGroupName = "rg-powershell-training",
        [string]$AutomationAccountName = "aa-powershell-training",
        [string]$Location = "East US"
    )
    
    Write-Host "Creating Azure Automation Account..." -ForegroundColor Yellow
    Write-Host "Automation Account: $AutomationAccountName" -ForegroundColor Cyan
    Write-Host "Resource Group: $ResourceGroupName" -ForegroundColor Cyan
    Write-Host "Location: $Location" -ForegroundColor Cyan
    
    # PowerShell command for automation account creation
    Write-Host "`nPowerShell command:" -ForegroundColor Magenta
    Write-Host "New-AzAutomationAccount -ResourceGroupName '$ResourceGroupName' -Name '$AutomationAccountName' -Location '$Location'" -ForegroundColor Cyan
    
    Write-Host "✅ Automation Account created successfully (simulated)" -ForegroundColor Green
}

function New-AutomationRunbook {
    param(
        [string]$RunbookName = "DailyMaintenanceRunbook",
        [string]$AutomationAccountName = "aa-powershell-training"
    )
    
    Write-Host "Creating Automation Runbook..." -ForegroundColor Yellow
    
    # Sample runbook content
    $runbookContent = @"
# Daily Maintenance Runbook
param(
    [string]`$ResourceGroupName = "rg-production"
)

# Connect to Azure
Connect-AzAccount -Identity

# Check VM status
`$vms = Get-AzVM -ResourceGroupName `$ResourceGroupName

foreach (`$vm in `$vms) {
    `$vmStatus = Get-AzVM -ResourceGroupName `$ResourceGroupName -Name `$vm.Name -Status
    Write-Output "VM: `$(`$vm.Name) - Status: `$(`$vmStatus.Statuses[1].DisplayStatus)"
    
    # Start stopped VMs if needed
    if (`$vmStatus.Statuses[1].DisplayStatus -eq "VM deallocated") {
        Write-Output "Starting VM: `$(`$vm.Name)"
        Start-AzVM -ResourceGroupName `$ResourceGroupName -Name `$vm.Name
    }
}

# Clean up old snapshots
`$snapshots = Get-AzSnapshot -ResourceGroupName `$ResourceGroupName
`$oldSnapshots = `$snapshots | Where-Object { `$_.TimeCreated -lt (Get-Date).AddDays(-30) }

foreach (`$snapshot in `$oldSnapshots) {
    Write-Output "Deleting old snapshot: `$(`$snapshot.Name)"
    Remove-AzSnapshot -ResourceGroupName `$ResourceGroupName -SnapshotName `$snapshot.Name -Force
}

Write-Output "Daily maintenance completed"
"@
    
    Write-Host "Runbook Content:" -ForegroundColor Magenta
    Write-Host $runbookContent -ForegroundColor Gray
    
    Write-Host "`nPowerShell command to create runbook:" -ForegroundColor Magenta
    Write-Host "Import-AzAutomationRunbook -AutomationAccountName '$AutomationAccountName' -Name '$RunbookName' -Type PowerShell -Path 'C:\Scripts\$RunbookName.ps1'" -ForegroundColor Cyan
    
    Write-Host "✅ Runbook created successfully (simulated)" -ForegroundColor Green
}

Write-Host "`n🏋️ EXERCISE 6: Azure Automation" -ForegroundColor Green
New-AzureAutomationAccount
New-AutomationRunbook

# ===== LESSON 7: MONITORING AND ALERTING =====
Write-Host "`n--- LESSON 7: Monitoring and Alerting ---" -ForegroundColor Magenta

Write-Host "🎯 TRAINER TIP: Proactive monitoring prevents downtime!" -ForegroundColor Green

function New-AzureAlert {
    param(
        [string]$ResourceGroupName = "rg-powershell-training",
        [string]$AlertName = "High-CPU-Alert",
        [string]$TargetResource = "vm-web-server"
    )
    
    Write-Host "Creating Azure Alert Rule..." -ForegroundColor Yellow
    Write-Host "Alert Name: $AlertName" -ForegroundColor Cyan
    Write-Host "Target Resource: $TargetResource" -ForegroundColor Cyan
    
    # Alert rule configuration
    $alertConfig = @{
        MetricName = "Percentage CPU"
        Operator = "GreaterThan"
        Threshold = 80
        WindowSize = "5m"
        Frequency = "1m"
        Severity = "2"
        ActionGroupName = "admin-notifications"
    }
    
    Write-Host "Alert Configuration:" -ForegroundColor Yellow
    Write-Host "  Metric: $($alertConfig.MetricName)" -ForegroundColor Cyan
    Write-Host "  Condition: $($alertConfig.Operator) $($alertConfig.Threshold)%" -ForegroundColor Cyan
    Write-Host "  Window: $($alertConfig.WindowSize)" -ForegroundColor Cyan
    Write-Host "  Frequency: $($alertConfig.Frequency)" -ForegroundColor Cyan
    
    # PowerShell command for alert creation
    Write-Host "`nPowerShell command:" -ForegroundColor Magenta
    Write-Host "Add-AzMetricAlertRule -ResourceGroupName '$ResourceGroupName' -Name '$AlertName' -MetricName '$($alertConfig.MetricName)' -Operator '$($alertConfig.Operator)' -Threshold $($alertConfig.Threshold)" -ForegroundColor Cyan
    
    Write-Host "✅ Alert rule created successfully (simulated)" -ForegroundColor Green
}

function Get-AzureMetrics {
    param(
        [string]$ResourceName = "vm-web-server",
        [string]$MetricName = "Percentage CPU",
        [int]$Hours = 1
    )
    
    Write-Host "Retrieving Azure Metrics..." -ForegroundColor Yellow
    Write-Host "Resource: $ResourceName" -ForegroundColor Cyan
    Write-Host "Metric: $MetricName" -ForegroundColor Cyan
    Write-Host "Time Range: Last $Hours hour(s)" -ForegroundColor Cyan
    
    # Simulated metrics data
    $metrics = @(
        @{Time="2024-01-01 09:00"; Value=45.2},
        @{Time="2024-01-01 09:05"; Value=52.8},
        @{Time="2024-01-01 09:10"; Value=38.1},
        @{Time="2024-01-01 09:15"; Value=67.3},
        @{Time="2024-01-01 09:20"; Value=84.5}
    )
    
    Write-Host "Metric Data:" -ForegroundColor Green
    foreach ($metric in $metrics) {
        $color = if ($metric.Value -gt 80) { "Red" } elseif ($metric.Value -gt 60) { "Yellow" } else { "Green" }
        Write-Host "  $($metric.Time): $($metric.Value)%" -ForegroundColor $color
    }
}

Write-Host "`n🏋️ EXERCISE 7: Monitoring Setup" -ForegroundColor Green
New-AzureAlert
Get-AzureMetrics

# ===== LESSON 8: AZURE POLICY AND GOVERNANCE =====
Write-Host "`n--- LESSON 8: Azure Policy and Governance ---" -ForegroundColor Magenta

Write-Host "🎯 TRAINER TIP: Implement governance for compliance and cost control!" -ForegroundColor Green

function New-AzurePolicy {
    param(
        [string]$PolicyName = "Require-Tags-Policy",
        [string]$PolicyDescription = "Require specific tags on all resources"
    )
    
    Write-Host "Creating Azure Policy..." -ForegroundColor Yellow
    Write-Host "Policy Name: $PolicyName" -ForegroundColor Cyan
    Write-Host "Description: $PolicyDescription" -ForegroundColor Cyan
    
    # Sample policy definition
    $policyDefinition = @"
{
    "mode": "All",
    "policyRule": {
        "if": {
            "allOf": [
                {
                    "field": "type",
                    "equals": "Microsoft.Resources/subscriptions/resourceGroups"
                },
                {
                    "not": {
                        "field": "tags['Environment']",
                        "exists": "true"
                    }
                }
            ]
        },
        "then": {
            "effect": "deny"
        }
    }
}
"@
    
    Write-Host "Policy Definition:" -ForegroundColor Yellow
    Write-Host $policyDefinition -ForegroundColor Gray
    
    Write-Host "`nPowerShell command:" -ForegroundColor Magenta
    Write-Host "New-AzPolicyDefinition -Name '$PolicyName' -Description '$PolicyDescription' -Policy `$policyDefinition" -ForegroundColor Cyan
    
    Write-Host "✅ Policy created successfully (simulated)" -ForegroundColor Green
}

function Get-AzureCostAnalysis {
    Write-Host "Analyzing Azure Costs..." -ForegroundColor Yellow
    
    # Simulated cost data
    $costData = @(
        @{Service="Virtual Machines"; Cost=245.67; Trend="↗️"},
        @{Service="Storage Accounts"; Cost=45.23; Trend="↗️"},
        @{Service="Networking"; Cost=67.89; Trend="↘️"},
        @{Service="Databases"; Cost=189.45; Trend="↗️"},
        @{Service="Monitoring"; Cost=12.34; Trend="→"}
    )
    
    Write-Host "Cost Analysis Report:" -ForegroundColor Green
    Write-Host "====================" -ForegroundColor Green
    
    $totalCost = 0
    foreach ($cost in $costData) {
        $totalCost += $cost.Cost
        Write-Host "💰 $($cost.Service): $($cost.Cost) USD $($cost.Trend)" -ForegroundColor Cyan
    }
    
    Write-Host "Total Monthly Cost: $totalCost USD" -ForegroundColor Yellow
}

Write-Host "`n🏋️ EXERCISE 8: Governance and Cost Management" -ForegroundColor Green
New-AzurePolicy
Get-AzureCostAnalysis

# ===== CAPSTONE PROJECT: ENTERPRISE AUTOMATION SUITE =====
Write-Host "`n--- CAPSTONE PROJECT: Enterprise Azure Automation Suite ---" -ForegroundColor Magenta

function New-EnterpriseAutomationSuite {
    Write-Host "Creating Enterprise Automation Suite..." -ForegroundColor Yellow
    
    # 1. Infrastructure as Code
    Write-Host "1. Deploying Infrastructure as Code..." -ForegroundColor Cyan
    
    # ARM Template or Bicep for infrastructure
    $infrastructureTemplate = @"
# Sample infrastructure deployment
New-AzResourceGroupDeployment -ResourceGroupName "rg-enterprise" -TemplateFile "infrastructure.json" -TemplateParameterFile "parameters.json"
"@
    
    # 2. Automated Backup Strategy
    Write-Host "2. Setting up Automated Backup Strategy..." -ForegroundColor Cyan
    
    # 3. Monitoring and Alerting
    Write-Host "3. Configuring Monitoring and Alerting..." -ForegroundColor Cyan
    
    # 4. Cost Optimization
    Write-Host "4. Implementing Cost Optimization..." -ForegroundColor Cyan
    
    # 5. Security and Compliance
    Write-Host "5. Applying Security and Compliance Policies..." -ForegroundColor Cyan
    
    Write-Host "✅ Enterprise Automation Suite deployed successfully!" -ForegroundColor Green
}

function Show-AzureToolkit {
    do {
        Clear-Host
        Write-Host "=== AZURE ENTERPRISE AUTOMATION TOOLKIT ===" -ForegroundColor Cyan
        Write-Host "Choose an option:" -ForegroundColor Yellow
        Write-Host "1. Resource Management"
        Write-Host "2. VM Operations"
        Write-Host "3. Storage Management"
        Write-Host "4. Automation Runbooks"
        Write-Host "5. Monitoring & Alerts"
        Write-Host "6. Cost Analysis"
        Write-Host "7. Policy Management"
        Write-Host "8. Backup Operations"
        Write-Host "9. Security Assessment"
        Write-Host "10. Exit"
        
        $choice = Read-Host "Enter your choice (1-10)"
        
        switch ($choice) {
            1 { Manage-ResourceGroups -Action "List" }
            2 { Get-AzureVMStatus }
            3 { Write-Host "Storage operations - Connect to your storage account" -ForegroundColor Yellow }
            4 { Write-Host "Automation runbooks - Manage your automation scripts" -ForegroundColor Yellow }
            5 { Get-AzureMetrics }
            6 { Get-AzureCostAnalysis }
            7 { Write-Host "Policy management - Govern your Azure resources" -ForegroundColor Yellow }
            8 { Write-Host "Backup operations - Protect your data" -ForegroundColor Yellow }
            9 { Write-Host "Security assessment - Evaluate your security posture" -ForegroundColor Yellow }
            10 { Write-Host "Exiting Azure toolkit. Happy automating!" -ForegroundColor Green; break }
            default { Write-Host "Invalid choice. Please try again." -ForegroundColor Red }
        }
        
        if ($choice -ne 10) {
            Write-Host "`nPress any key to continue..." -ForegroundColor Gray
            $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
        }
    } while ($choice -ne 10)
}

Write-Host "`n🏋️ CAPSTONE PROJECT: Enterprise Suite" -ForegroundColor Green
New-EnterpriseAutomationSuite
Write-Host "Run: Show-AzureToolkit" -ForegroundColor Cyan

# ===== TRAINING COMPLETION =====
Write-Host "`n🎓 AZURE POWERSHELL TRAINING COMPLETE!" -ForegroundColor Green
Write-Host "You've mastered:" -ForegroundColor Yellow
Write-Host "  ✅ Azure PowerShell setup and authentication"
Write-Host "  ✅ Resource group and VM management"
Write-Host "  ✅ Storage account automation"
Write-Host "  ✅ Azure Automation accounts and runbooks"
Write-Host "  ✅ Monitoring and alerting systems"
Write-Host "  ✅ Policy and governance implementation"
Write-Host "  ✅ Cost analysis and optimization"
Write-Host "  ✅ Enterprise-scale automation suite"

Write-Host "`n🚀 CONGRATULATIONS!" -ForegroundColor Cyan
Write-Host "You are now a PowerShell automation expert capable of:" -ForegroundColor Green
Write-Host "  • Managing Windows systems at scale"
Write-Host "  • Automating Azure cloud resources"
Write-Host "  • Implementing enterprise governance"
Write-Host "  • Creating comprehensive automation solutions"
Write-Host "  • Monitoring and optimizing cloud infrastructure"

Write-Host "`n💡 NEXT STEPS:" -ForegroundColor Yellow
Write-Host "1. Practice with real Azure resources"
Write-Host "2. Build your automation portfolio"
Write-Host "3. Explore advanced topics: ARM templates, Bicep, DevOps"
Write-Host "4. Join PowerShell and Azure communities"
Write-Host "5. Consider Azure certifications"

Write-Host "`n🎯 Remember: You now have the power to automate entire enterprises!" -ForegroundColor Green
Write-Host "Use your skills responsibly and keep learning!" -ForegroundColor Cyan