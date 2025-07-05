# PowerShell Training Session 2: Windows Automation
# Advanced Windows System Administration & Automation 🚀

Write-Host "=== POWERSHELL WINDOWS AUTOMATION TRAINING ===" -ForegroundColor Cyan
Write-Host "Session 2: Advanced Windows Administration" -ForegroundColor Yellow
Write-Host "Trainer: Your AI PowerShell Coach" -ForegroundColor Green

# ===== LESSON 1: ADVANCED FILE OPERATIONS =====
Write-Host "`n--- LESSON 1: Advanced File & Folder Operations ---" -ForegroundColor Magenta

Write-Host "🎯 TRAINER TIP: Automate file operations to save hours of manual work!" -ForegroundColor Green

# Create a sample directory structure for practice
$practiceDir = "$env:TEMP\PowerShellTraining"
$subDirs = @("Documents", "Images", "Music", "Videos", "Archive")

Write-Host "Creating practice directory structure..." -ForegroundColor Yellow
New-Item -Path $practiceDir -ItemType Directory -Force | Out-Null

foreach ($dir in $subDirs) {
    New-Item -Path "$practiceDir\$dir" -ItemType Directory -Force | Out-Null
}

# Create sample files
$sampleFiles = @(
    @{Name="report.docx"; Path="Documents"},
    @{Name="presentation.pptx"; Path="Documents"},
    @{Name="vacation.jpg"; Path="Images"},
    @{Name="family.png"; Path="Images"},
    @{Name="song.mp3"; Path="Music"},
    @{Name="video.mp4"; Path="Videos"}
)

foreach ($file in $sampleFiles) {
    $filePath = Join-Path "$practiceDir\$($file.Path)" $file.Name
    "Sample content" | Out-File -FilePath $filePath -Force
}

Write-Host "✅ Practice environment created at: $practiceDir" -ForegroundColor Green

# AUTOMATION EXAMPLE 1: Organize files by date
Write-Host "`n🏋️ EXERCISE 1: Auto-organize files by date" -ForegroundColor Green

function Organize-FilesByDate {
    param([string]$SourcePath)
    
    $files = Get-ChildItem -Path $SourcePath -File -Recurse
    
    foreach ($file in $files) {
        $year = $file.LastWriteTime.Year
        $month = $file.LastWriteTime.ToString("MM-MMM")
        
        $destPath = Join-Path $SourcePath "Archive\$year\$month"
        
        if (!(Test-Path $destPath)) {
            New-Item -Path $destPath -ItemType Directory -Force | Out-Null
        }
        
        Write-Host "Moving $($file.Name) to $destPath" -ForegroundColor Yellow
        # Move-Item -Path $file.FullName -Destination $destPath -Force
    }
}

Write-Host "Function created: Organize-FilesByDate"
Write-Host "Usage: Organize-FilesByDate -SourcePath 'C:\YourFolder'"

# ===== LESSON 2: SYSTEM SERVICES MANAGEMENT =====
Write-Host "`n--- LESSON 2: Managing Windows Services ---" -ForegroundColor Magenta

Write-Host "🎯 TRAINER TIP: Automate service management for system reliability!" -ForegroundColor Green

# Get service status
$criticalServices = @("Spooler", "BITS", "Themes", "AudioSrv", "Dhcp")

function Get-ServiceStatus {
    param([string[]]$ServiceNames)
    
    Write-Host "Service Status Report:" -ForegroundColor Yellow
    Write-Host "======================" -ForegroundColor Yellow
    
    foreach ($serviceName in $ServiceNames) {
        try {
            $service = Get-Service -Name $serviceName -ErrorAction Stop
            
            $status = if ($service.Status -eq "Running") {
                "✅ RUNNING"
            } else {
                "❌ STOPPED"
            }
            
            Write-Host "$($service.DisplayName): $status" -ForegroundColor $(if ($service.Status -eq "Running") { "Green" } else { "Red" })
        }
        catch {
            Write-Host "$serviceName: ❓ NOT FOUND" -ForegroundColor Yellow
        }
    }
}

Write-Host "`n🏋️ EXERCISE 2: Check critical services" -ForegroundColor Green
Get-ServiceStatus -ServiceNames $criticalServices

# Advanced service management function
function Manage-CriticalServices {
    param(
        [string[]]$ServiceNames,
        [string]$Action = "Check"
    )
    
    switch ($Action) {
        "Check" {
            Get-ServiceStatus -ServiceNames $ServiceNames
        }
        "Start" {
            foreach ($serviceName in $ServiceNames) {
                $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue
                if ($service -and $service.Status -eq "Stopped") {
                    Write-Host "Starting $serviceName..." -ForegroundColor Yellow
                    # Start-Service -Name $serviceName
                    Write-Host "✅ $serviceName started (simulated)" -ForegroundColor Green
                }
            }
        }
        "Stop" {
            Write-Host "⚠️  Stopping services - Use with caution!" -ForegroundColor Red
            # Implementation here
        }
    }
}

# ===== LESSON 3: REGISTRY OPERATIONS =====
Write-Host "`n--- LESSON 3: Windows Registry Automation ---" -ForegroundColor Magenta

Write-Host "🎯 TRAINER TIP: Automate registry changes for system configuration!" -ForegroundColor Green

function Get-RegistryValue {
    param(
        [string]$Path,
        [string]$Name
    )
    
    try {
        $value = Get-ItemProperty -Path $Path -Name $Name -ErrorAction Stop
        return $value.$Name
    }
    catch {
        return "Not Found"
    }
}

Write-Host "`n🏋️ EXERCISE 3: Read system registry values" -ForegroundColor Green

# Common registry locations
$registryChecks = @(
    @{Path="HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion"; Name="ProductName"},
    @{Path="HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion"; Name="RegisteredOwner"},
    @{Path="HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion"; Name="InstallDate"}
)

Write-Host "System Registry Information:" -ForegroundColor Yellow
foreach ($check in $registryChecks) {
    $value = Get-RegistryValue -Path $check.Path -Name $check.Name
    Write-Host "  $($check.Name): $value"
}

# ===== LESSON 4: EVENT LOG MONITORING =====
Write-Host "`n--- LESSON 4: Event Log Monitoring ---" -ForegroundColor Magenta

Write-Host "🎯 TRAINER TIP: Monitor system events for proactive maintenance!" -ForegroundColor Green

function Get-SystemEvents {
    param(
        [string]$LogName = "System",
        [int]$Hours = 24,
        [string]$Level = "Error"
    )
    
    $startTime = (Get-Date).AddHours(-$Hours)
    
    Write-Host "Searching for $Level events in $LogName log (last $Hours hours)..." -ForegroundColor Yellow
    
    try {
        $events = Get-WinEvent -FilterHashtable @{
            LogName = $LogName
            Level = if ($Level -eq "Error") { 2 } elseif ($Level -eq "Warning") { 3 } else { 4 }
            StartTime = $startTime
        } -MaxEvents 10 -ErrorAction Stop
        
        Write-Host "Found $($events.Count) events:" -ForegroundColor Green
        
        foreach ($event in $events) {
            Write-Host "  [$($event.TimeCreated)] $($event.LevelDisplayName): $($event.Message.Substring(0, [Math]::Min(100, $event.Message.Length)))..." -ForegroundColor Red
        }
    }
    catch {
        Write-Host "No events found or access denied" -ForegroundColor Yellow
    }
}

Write-Host "`n🏋️ EXERCISE 4: Check recent system errors" -ForegroundColor Green
Get-SystemEvents -LogName "System" -Hours 24 -Level "Error"

# ===== LESSON 5: PERFORMANCE MONITORING =====
Write-Host "`n--- LESSON 5: Performance Monitoring ---" -ForegroundColor Magenta

Write-Host "🎯 TRAINER TIP: Monitor system performance to prevent issues!" -ForegroundColor Green

function Get-SystemPerformance {
    Write-Host "System Performance Report:" -ForegroundColor Yellow
    Write-Host "=========================" -ForegroundColor Yellow
    
    # CPU Usage
    $cpu = Get-WmiObject -Class Win32_Processor | Measure-Object -Property LoadPercentage -Average
    $cpuUsage = [math]::Round($cpu.Average, 2)
    
    # Memory Usage
    $memory = Get-WmiObject -Class Win32_OperatingSystem
    $totalMemory = [math]::Round($memory.TotalVisibleMemorySize / 1MB, 2)
    $freeMemory = [math]::Round($memory.FreePhysicalMemory / 1MB, 2)
    $usedMemory = $totalMemory - $freeMemory
    $memoryUsagePercent = [math]::Round(($usedMemory / $totalMemory) * 100, 2)
    
    # Disk Usage
    $disks = Get-WmiObject -Class Win32_LogicalDisk -Filter "DriveType=3"
    
    Write-Host "CPU Usage: $cpuUsage%" -ForegroundColor $(if ($cpuUsage -gt 80) { "Red" } elseif ($cpuUsage -gt 60) { "Yellow" } else { "Green" })
    Write-Host "Memory Usage: $memoryUsagePercent% ($usedMemory GB / $totalMemory GB)" -ForegroundColor $(if ($memoryUsagePercent -gt 80) { "Red" } elseif ($memoryUsagePercent -gt 60) { "Yellow" } else { "Green" })
    
    Write-Host "Disk Usage:" -ForegroundColor Yellow
    foreach ($disk in $disks) {
        $freeSpaceGB = [math]::Round($disk.FreeSpace / 1GB, 2)
        $totalSpaceGB = [math]::Round($disk.Size / 1GB, 2)
        $usedSpacePercent = [math]::Round((($disk.Size - $disk.FreeSpace) / $disk.Size) * 100, 2)
        
        Write-Host "  Drive $($disk.DeviceID) $usedSpacePercent% used ($freeSpaceGB GB free)" -ForegroundColor $(if ($usedSpacePercent -gt 90) { "Red" } elseif ($usedSpacePercent -gt 80) { "Yellow" } else { "Green" })
    }
    
    # Top processes
    $topProcesses = Get-Process | Sort-Object CPU -Descending | Select-Object -First 5
    Write-Host "Top 5 CPU-consuming processes:" -ForegroundColor Yellow
    foreach ($process in $topProcesses) {
        Write-Host "  $($process.Name): CPU = $($process.CPU)" -ForegroundColor Cyan
    }
}

Write-Host "`n🏋️ EXERCISE 5: System performance check" -ForegroundColor Green
Get-SystemPerformance

# ===== LESSON 6: AUTOMATED MAINTENANCE =====
Write-Host "`n--- LESSON 6: Automated System Maintenance ---" -ForegroundColor Magenta

Write-Host "🎯 TRAINER TIP: Automate maintenance tasks for optimal system health!" -ForegroundColor Green

function Invoke-SystemMaintenance {
    param([switch]$FullMaintenance)
    
    Write-Host "Starting automated system maintenance..." -ForegroundColor Yellow
    
    # 1. Clean temporary files
    Write-Host "1. Cleaning temporary files..." -ForegroundColor Cyan
    $tempPaths = @("$env:TEMP\*", "$env:LOCALAPPDATA\Temp\*")
    
    foreach ($path in $tempPaths) {
        try {
            $files = Get-ChildItem -Path $path -Recurse -Force -ErrorAction SilentlyContinue
            $fileCount = $files.Count
            $totalSize = ($files | Measure-Object -Property Length -Sum -ErrorAction SilentlyContinue).Sum
            
            if ($totalSize) {
                $totalSizeMB = [math]::Round($totalSize / 1MB, 2)
                Write-Host "  Found $fileCount files ($totalSizeMB MB) to clean" -ForegroundColor Yellow
                # Remove-Item -Path $path -Recurse -Force -ErrorAction SilentlyContinue
                Write-Host "  ✅ Cleaned (simulated)" -ForegroundColor Green
            }
        }
        catch {
            Write-Host "  ⚠️  Could not clean $path" -ForegroundColor Yellow
        }
    }
    
    # 2. Check disk space
    Write-Host "2. Checking disk space..." -ForegroundColor Cyan
    $disks = Get-WmiObject -Class Win32_LogicalDisk -Filter "DriveType=3"
    foreach ($disk in $disks) {
        $freeSpacePercent = [math]::Round(($disk.FreeSpace / $disk.Size) * 100, 2)
        if ($freeSpacePercent -lt 15) {
            Write-Host "  ⚠️  Drive $($disk.DeviceID) is low on space ($freeSpacePercent% free)" -ForegroundColor Red
        } else {
            Write-Host "  ✅ Drive $($disk.DeviceID) has sufficient space ($freeSpacePercent% free)" -ForegroundColor Green
        }
    }
    
    # 3. Check critical services
    Write-Host "3. Checking critical services..." -ForegroundColor Cyan
    Get-ServiceStatus -ServiceNames $criticalServices
    
    if ($FullMaintenance) {
        Write-Host "4. Running full maintenance tasks..." -ForegroundColor Cyan
        Write-Host "  - Defragmentation check (simulated)" -ForegroundColor Yellow
        Write-Host "  - System file check (simulated)" -ForegroundColor Yellow
        Write-Host "  - Registry cleanup (simulated)" -ForegroundColor Yellow
    }
    
    Write-Host "✅ System maintenance completed!" -ForegroundColor Green
}

Write-Host "`n🏋️ EXERCISE 6: Run automated maintenance" -ForegroundColor Green
Invoke-SystemMaintenance

# ===== LESSON 7: SCHEDULED TASKS =====
Write-Host "`n--- LESSON 7: Creating Scheduled Tasks ---" -ForegroundColor Magenta

Write-Host "🎯 TRAINER TIP: Schedule your automation to run automatically!" -ForegroundColor Green

function New-MaintenanceTask {
    param(
        [string]$TaskName = "PowerShell Daily Maintenance",
        [string]$ScriptPath = "C:\Scripts\DailyMaintenance.ps1",
        [string]$Time = "02:00"
    )
    
    Write-Host "Creating scheduled task: $TaskName" -ForegroundColor Yellow
    
    # Create the script content
    $scriptContent = @"
# Daily Maintenance Script
Write-Host "Running daily maintenance..." -ForegroundColor Green
Invoke-SystemMaintenance -FullMaintenance
"@
    
    # Ensure script directory exists
    $scriptDir = Split-Path $ScriptPath -Parent
    if (!(Test-Path $scriptDir)) {
        New-Item -Path $scriptDir -ItemType Directory -Force | Out-Null
    }
    
    # Save the script
    $scriptContent | Out-File -FilePath $ScriptPath -Force
    
    Write-Host "Script saved to: $ScriptPath" -ForegroundColor Green
    Write-Host "To create the scheduled task, run as Administrator:" -ForegroundColor Yellow
    Write-Host "schtasks /create /tn '$TaskName' /tr 'powershell.exe -File $ScriptPath' /sc daily /st $Time" -ForegroundColor Cyan
}

Write-Host "`n🏋️ EXERCISE 7: Create maintenance script" -ForegroundColor Green
New-MaintenanceTask

# ===== PRACTICAL PROJECT: SYSTEM ADMIN TOOLKIT =====
Write-Host "`n--- PRACTICAL PROJECT: Complete System Admin Toolkit ---" -ForegroundColor Magenta

function Show-AdminToolkit {
    do {
        Clear-Host
        Write-Host "=== WINDOWS SYSTEM ADMINISTRATION TOOLKIT ===" -ForegroundColor Cyan
        Write-Host "Choose an option:" -ForegroundColor Yellow
        Write-Host "1. System Performance Report"
        Write-Host "2. Service Status Check"
        Write-Host "3. Event Log Analysis"
        Write-Host "4. Disk Space Analysis"
        Write-Host "5. Run System Maintenance"
        Write-Host "6. File Organization"
        Write-Host "7. Registry Information"
        Write-Host "8. Exit"
        
        $choice = Read-Host "Enter your choice (1-8)"
        
        switch ($choice) {
            1 { Get-SystemPerformance }
            2 { Get-ServiceStatus -ServiceNames $criticalServices }
            3 { Get-SystemEvents -LogName "System" -Hours 24 -Level "Error" }
            4 { Get-SystemPerformance }
            5 { Invoke-SystemMaintenance -FullMaintenance }
            6 { Write-Host "File organization feature - Add your custom logic here" -ForegroundColor Yellow }
            7 { 
                Write-Host "Registry Information:" -ForegroundColor Yellow
                foreach ($check in $registryChecks) {
                    $value = Get-RegistryValue -Path $check.Path -Name $check.Name
                    Write-Host "  $($check.Name): $value"
                }
            }
            8 { Write-Host "Exiting toolkit. Goodbye!" -ForegroundColor Green; break }
            default { Write-Host "Invalid choice. Please try again." -ForegroundColor Red }
        }
        
        if ($choice -ne 8) {
            Write-Host "`nPress any key to continue..." -ForegroundColor Gray
            $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
        }
    } while ($choice -ne 8)
}

Write-Host "`n🏋️ FINAL EXERCISE: Launch your admin toolkit" -ForegroundColor Green
Write-Host "Run: Show-AdminToolkit" -ForegroundColor Cyan

# ===== TRAINING SUMMARY =====
Write-Host "`n🎓 TRAINING SESSION 2 COMPLETE!" -ForegroundColor Green
Write-Host "You've mastered:" -ForegroundColor Yellow
Write-Host "  ✅ Advanced file operations and automation"
Write-Host "  ✅ Windows service management"
Write-Host "  ✅ Registry operations"
Write-Host "  ✅ Event log monitoring"
Write-Host "  ✅ Performance monitoring"
Write-Host "  ✅ Automated system maintenance"
Write-Host "  ✅ Scheduled task creation"
Write-Host "  ✅ Complete system administration toolkit"

Write-Host "`n🚀 NEXT SESSION: Azure Automation & Cloud Management" -ForegroundColor Cyan
Write-Host "You're ready to take your PowerShell skills to the cloud!" -ForegroundColor Green

Write-Host "`n💡 HOMEWORK:" -ForegroundColor Yellow
Write-Host "1. Run Show-AdminToolkit and explore all features"
Write-Host "2. Customize the maintenance script for your needs"
Write-Host "3. Practice creating scheduled tasks"
Write-Host "4. Ask your trainer: 'How do I automate Azure resources?'"

Write-Host "`n🎯 You're now a Windows PowerShell automation expert!" -ForegroundColor Green