# PowerShell Guru Path: From Zero to Hero (Non-Developer Edition) 🚀

## 🎯 Your 90-Day Journey to PowerShell Mastery

**Target Audience**: Complete beginners with no programming background
**Goal**: Become a PowerShell automation expert who can solve real-world problems
**Time Investment**: 45-60 minutes daily
**Success Guarantee**: By day 90, you'll be automating tasks like a pro!

---

## 🌟 Why PowerShell Will Transform Your Work Life

### **Before PowerShell:**
- ❌ Manually copying files every day
- ❌ Clicking through endless dialog boxes
- ❌ Spending hours on repetitive tasks
- ❌ Making human errors in routine work

### **After PowerShell:**
- ✅ Automate repetitive tasks in minutes
- ✅ Manage hundreds of files with one command
- ✅ Create professional reports automatically
- ✅ Impress colleagues with your efficiency

---

## 📅 The Complete 90-Day Curriculum

## **WEEK 1-2: Foundation & First Steps**

### **Day 1-3: What is PowerShell?**
**Time**: 30 minutes/day

#### **Day 1 Mission**: Open PowerShell and run your first command
```powershell
# Your very first PowerShell command
Get-Date
Write-Host "Hello, I'm learning PowerShell!"
```

#### **Cursor Tasks for Day 1:**
- "Explain what PowerShell is in simple terms for a non-programmer"
- "Show me how to open PowerShell on Windows"
- "Create 5 simple PowerShell commands a beginner can try"

#### **Day 2 Mission**: Explore your computer with PowerShell
```powershell
# See what's on your computer
Get-ComputerInfo
Get-Process
Get-Service
```

#### **Day 3 Mission**: Your first useful task
```powershell
# Find large files taking up space
Get-ChildItem -Path C:\ -Recurse | Where-Object {$_.Length -gt 100MB} | Select-Object Name, Length, Directory
```

### **Day 4-7: Basic Commands & Navigation**
**Time**: 45 minutes/day

#### **Essential Commands to Master:**
```powershell
# Navigate folders
Set-Location "C:\Users\YourName\Documents"
Get-ChildItem                    # List files
Get-ChildItem -Directory         # List only folders
Get-ChildItem -File              # List only files

# Get information about files
Get-ChildItem | Select-Object Name, Length, LastWriteTime
```

#### **Daily Cursor Practice:**
- "Show me how to navigate folders in PowerShell"
- "Create a script to find all .docx files on my computer"
- "How do I see file sizes in a readable format?"

### **Day 8-14: Variables & Basic Operations**
**Time**: 45 minutes/day

#### **Understanding Variables:**
```powershell
# Store information in variables
$myName = "John Doe"
$today = Get-Date
$files = Get-ChildItem

# Use variables
Write-Host "Hello, $myName"
Write-Host "Today is $today"
Write-Host "You have $($files.Count) files in this folder"
```

#### **Week 2 Project**: Personal System Info Dashboard
```powershell
# Create your first useful script
$computerName = $env:COMPUTERNAME
$currentUser = $env:USERNAME
$currentDate = Get-Date
$freeSpace = Get-WmiObject -Class Win32_LogicalDisk | Select-Object DeviceID, FreeSpace

Write-Host "=== MY COMPUTER INFO ===" -ForegroundColor Green
Write-Host "Computer: $computerName"
Write-Host "User: $currentUser"
Write-Host "Date: $currentDate"
Write-Host "Free Space: $freeSpace"
```

---

## **WEEK 3-4: Making Decisions & Loops**

### **Day 15-21: If Statements (Making Decisions)**
**Time**: 45 minutes/day

#### **Basic Decision Making:**
```powershell
# Check if it's weekend
$today = (Get-Date).DayOfWeek
if ($today -eq "Saturday" -or $today -eq "Sunday") {
    Write-Host "It's the weekend! 🎉"
} else {
    Write-Host "It's a weekday. Time to work! 💼"
}
```

#### **Practical Example - Disk Space Monitor:**
```powershell
$diskSpace = Get-WmiObject -Class Win32_LogicalDisk -Filter "DriveType=3" | Select-Object DeviceID, FreeSpace, Size

foreach ($disk in $diskSpace) {
    $percentFree = [math]::Round(($disk.FreeSpace / $disk.Size) * 100, 2)
    
    if ($percentFree -lt 10) {
        Write-Host "WARNING: Drive $($disk.DeviceID) is $percentFree% free!" -ForegroundColor Red
    } elseif ($percentFree -lt 20) {
        Write-Host "CAUTION: Drive $($disk.DeviceID) is $percentFree% free" -ForegroundColor Yellow
    } else {
        Write-Host "OK: Drive $($disk.DeviceID) is $percentFree% free" -ForegroundColor Green
    }
}
```

### **Day 22-28: Loops (Repeating Tasks)**
**Time**: 45 minutes/day

#### **For Each Loop - Process Multiple Items:**
```powershell
# Organize files by extension
$files = Get-ChildItem -File
foreach ($file in $files) {
    $extension = $file.Extension
    if ($extension -eq ".txt") {
        Write-Host "$($file.Name) is a text file"
    } elseif ($extension -eq ".jpg" -or $extension -eq ".png") {
        Write-Host "$($file.Name) is an image file"
    }
}
```

#### **Week 4 Project**: Automated File Organizer
```powershell
# Organize your Downloads folder
$sourceFolder = "$env:USERPROFILE\Downloads"
$files = Get-ChildItem -Path $sourceFolder -File

foreach ($file in $files) {
    $extension = $file.Extension.ToLower()
    
    # Create folders for different file types
    $destinationFolder = switch ($extension) {
        ".pdf" { "$sourceFolder\PDFs" }
        ".docx" { "$sourceFolder\Documents" }
        ".jpg" { "$sourceFolder\Images" }
        ".png" { "$sourceFolder\Images" }
        ".mp3" { "$sourceFolder\Music" }
        ".mp4" { "$sourceFolder\Videos" }
        default { "$sourceFolder\Other" }
    }
    
    # Create folder if it doesn't exist
    if (!(Test-Path $destinationFolder)) {
        New-Item -Path $destinationFolder -ItemType Directory -Force
    }
    
    # Move file to appropriate folder
    Move-Item -Path $file.FullName -Destination $destinationFolder
    Write-Host "Moved $($file.Name) to $destinationFolder"
}
```

---

## **WEEK 5-6: Working with Files & Folders**

### **Day 29-35: File Operations**
**Time**: 45 minutes/day

#### **Essential File Operations:**
```powershell
# Create files and folders
New-Item -Path "C:\MyScripts" -ItemType Directory
New-Item -Path "C:\MyScripts\test.txt" -ItemType File

# Copy files
Copy-Item -Path "source.txt" -Destination "backup.txt"

# Move files
Move-Item -Path "old_location.txt" -Destination "new_location.txt"

# Delete files (be careful!)
Remove-Item -Path "unwanted_file.txt"
```

#### **Practical Example - Backup Script:**
```powershell
# Backup important documents
$sourceFolder = "$env:USERPROFILE\Documents"
$backupFolder = "$env:USERPROFILE\Backup_$(Get-Date -Format 'yyyy-MM-dd')"

# Create backup folder
New-Item -Path $backupFolder -ItemType Directory -Force

# Copy all documents
Copy-Item -Path "$sourceFolder\*" -Destination $backupFolder -Recurse
Write-Host "Backup completed to $backupFolder"
```

### **Day 36-42: Text Processing & Reports**
**Time**: 45 minutes/day

#### **Working with Text Files:**
```powershell
# Read text files
$content = Get-Content -Path "data.txt"

# Write to text files
$report = "System Report - $(Get-Date)"
$report | Out-File -FilePath "report.txt"

# Append to files
"New line of data" | Add-Content -Path "log.txt"
```

#### **Week 6 Project**: System Health Reporter
```powershell
# Create a comprehensive system report
$reportFile = "SystemReport_$(Get-Date -Format 'yyyy-MM-dd').txt"

# Gather system information
$computerInfo = Get-ComputerInfo
$diskInfo = Get-WmiObject -Class Win32_LogicalDisk
$processes = Get-Process | Sort-Object CPU -Descending | Select-Object -First 10

# Create report
$report = @"
=== SYSTEM HEALTH REPORT ===
Generated: $(Get-Date)

Computer Name: $($computerInfo.CsName)
Operating System: $($computerInfo.WindowsProductName)
Total Memory: $([math]::Round($computerInfo.TotalPhysicalMemory / 1GB, 2)) GB

=== DISK USAGE ===
"@

foreach ($disk in $diskInfo) {
    $freeGB = [math]::Round($disk.FreeSpace / 1GB, 2)
    $totalGB = [math]::Round($disk.Size / 1GB, 2)
    $percentFree = [math]::Round(($disk.FreeSpace / $disk.Size) * 100, 2)
    
    $report += "`nDrive $($disk.DeviceID) - $freeGB GB free of $totalGB GB ($percentFree% free)"
}

$report += "`n`n=== TOP 10 PROCESSES BY CPU ==="
foreach ($process in $processes) {
    $report += "`n$($process.Name) - CPU: $($process.CPU)"
}

# Save report
$report | Out-File -FilePath $reportFile -Encoding UTF8
Write-Host "Report saved to $reportFile"
```

---

## **WEEK 7-8: Functions & Reusable Code**

### **Day 43-49: Creating Functions**
**Time**: 45 minutes/day

#### **Your First Function:**
```powershell
# Create a reusable function
function Get-FolderSize {
    param([string]$Path)
    
    $size = (Get-ChildItem -Path $Path -Recurse -File | Measure-Object -Property Length -Sum).Sum
    $sizeInMB = [math]::Round($size / 1MB, 2)
    
    return "$sizeInMB MB"
}

# Use the function
$documentsSize = Get-FolderSize -Path "$env:USERPROFILE\Documents"
Write-Host "Documents folder size: $documentsSize"
```

#### **Advanced Function Example:**
```powershell
function Backup-Folder {
    param(
        [string]$SourcePath,
        [string]$BackupPath = "$env:USERPROFILE\Backups"
    )
    
    # Create backup folder with timestamp
    $timestamp = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
    $backupFolder = Join-Path $BackupPath "Backup_$timestamp"
    
    # Create backup
    New-Item -Path $backupFolder -ItemType Directory -Force
    Copy-Item -Path "$SourcePath\*" -Destination $backupFolder -Recurse
    
    Write-Host "Backup completed: $backupFolder" -ForegroundColor Green
    return $backupFolder
}

# Use the function
Backup-Folder -SourcePath "$env:USERPROFILE\Documents"
```

### **Day 50-56: Error Handling**
**Time**: 45 minutes/day

#### **Making Your Scripts Bulletproof:**
```powershell
function Safe-FileOperation {
    param([string]$FilePath)
    
    try {
        # Try to perform the operation
        $content = Get-Content -Path $FilePath -ErrorAction Stop
        Write-Host "File read successfully"
        return $content
    }
    catch {
        # Handle errors gracefully
        Write-Host "Error reading file: $($_.Exception.Message)" -ForegroundColor Red
        return $null
    }
    finally {
        # This always runs
        Write-Host "File operation completed"
    }
}

# Test the function
$result = Safe-FileOperation -FilePath "nonexistent.txt"
```

---

## **WEEK 9-10: Automation & Scheduling**

### **Day 57-63: Advanced Automation**
**Time**: 60 minutes/day

#### **Web Content Automation:**
```powershell
# Download files from the internet
function Download-File {
    param(
        [string]$Url,
        [string]$OutputPath
    )
    
    try {
        Invoke-WebRequest -Uri $Url -OutFile $OutputPath
        Write-Host "Downloaded: $OutputPath" -ForegroundColor Green
    }
    catch {
        Write-Host "Download failed: $($_.Exception.Message)" -ForegroundColor Red
    }
}

# Usage
Download-File -Url "https://example.com/file.zip" -OutputPath "C:\Downloads\file.zip"
```

#### **Email Automation:**
```powershell
function Send-SystemReport {
    param(
        [string]$To,
        [string]$SmtpServer,
        [string]$From
    )
    
    # Generate report
    $report = "System Report - $(Get-Date)"
    $report += "`nComputer: $env:COMPUTERNAME"
    $report += "`nUser: $env:USERNAME"
    
    # Send email
    Send-MailMessage -To $To -From $From -Subject "System Report" -Body $report -SmtpServer $SmtpServer
}
```

### **Day 64-70: Task Scheduling**
**Time**: 60 minutes/day

#### **Creating Scheduled Tasks:**
```powershell
# Create a scheduled task to run your script daily
$action = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "-File C:\MyScripts\DailyMaintenance.ps1"
$trigger = New-ScheduledTaskTrigger -Daily -At "2:00 AM"
$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries

Register-ScheduledTask -Action $action -Trigger $trigger -Settings $settings -TaskName "Daily Maintenance" -Description "Run daily system maintenance"
```

---

## **WEEK 11-12: Advanced Topics & Real-World Projects**

### **Day 71-77: Working with APIs & External Data**
**Time**: 60 minutes/day

#### **Weather API Integration:**
```powershell
function Get-WeatherReport {
    param([string]$City)
    
    $apiKey = "YOUR_API_KEY"
    $url = "http://api.openweathermap.org/data/2.5/weather?q=$City&appid=$apiKey&units=metric"
    
    try {
        $response = Invoke-RestMethod -Uri $url
        $weather = @{
            City = $response.name
            Temperature = $response.main.temp
            Description = $response.weather[0].description
            Humidity = $response.main.humidity
        }
        return $weather
    }
    catch {
        Write-Host "Weather data not available" -ForegroundColor Red
    }
}

# Usage
$weather = Get-WeatherReport -City "New York"
Write-Host "Weather in $($weather.City): $($weather.Temperature)°C, $($weather.Description)"
```

### **Day 78-84: Database Operations**
**Time**: 60 minutes/day

#### **Working with CSV Data:**
```powershell
# Import and analyze CSV data
$data = Import-Csv -Path "sales_data.csv"

# Group by category
$grouped = $data | Group-Object Category | ForEach-Object {
    @{
        Category = $_.Name
        Count = $_.Count
        TotalSales = ($_.Group | Measure-Object Sales -Sum).Sum
    }
}

# Export results
$grouped | Export-Csv -Path "sales_summary.csv" -NoTypeInformation
```

---

## **WEEK 13: Capstone Projects & Mastery**

### **Day 85-90: Build Your PowerShell Portfolio**
**Time**: 60 minutes/day

#### **Project 1: Complete System Administrator Toolkit**
```powershell
# Master script that includes all your tools
function Show-SystemMenu {
    do {
        Clear-Host
        Write-Host "=== POWERSHELL SYSTEM TOOLKIT ===" -ForegroundColor Cyan
        Write-Host "1. System Health Check"
        Write-Host "2. Disk Cleanup"
        Write-Host "3. Backup Files"
        Write-Host "4. Network Diagnostics"
        Write-Host "5. Process Monitor"
        Write-Host "6. Exit"
        
        $choice = Read-Host "Select an option (1-6)"
        
        switch ($choice) {
            1 { Invoke-SystemHealthCheck }
            2 { Invoke-DiskCleanup }
            3 { Invoke-BackupFiles }
            4 { Invoke-NetworkDiagnostics }
            5 { Invoke-ProcessMonitor }
            6 { Write-Host "Goodbye!" -ForegroundColor Green; break }
            default { Write-Host "Invalid option!" -ForegroundColor Red }
        }
        
        if ($choice -ne 6) {
            Read-Host "Press Enter to continue..."
        }
    } while ($choice -ne 6)
}

# Launch the menu
Show-SystemMenu
```

#### **Project 2: Automated Report Generator**
```powershell
# Generate comprehensive reports
function New-MonthlyReport {
    $reportDate = Get-Date -Format "yyyy-MM"
    $reportPath = "Reports\Monthly_Report_$reportDate.html"
    
    # Create HTML report
    $html = @"
<!DOCTYPE html>
<html>
<head>
    <title>Monthly System Report</title>
    <style>
        body { font-family: Arial, sans-serif; }
        .header { background-color: #4CAF50; color: white; padding: 10px; }
        .content { padding: 20px; }
        .warning { color: red; }
        .good { color: green; }
    </style>
</head>
<body>
    <div class="header">
        <h1>Monthly System Report - $reportDate</h1>
    </div>
    <div class="content">
        <h2>System Information</h2>
        <p>Computer: $env:COMPUTERNAME</p>
        <p>Generated: $(Get-Date)</p>
        
        <h2>Disk Usage</h2>
        <!-- Disk usage data will be inserted here -->
        
        <h2>System Performance</h2>
        <!-- Performance data will be inserted here -->
    </div>
</body>
</html>
"@
    
    $html | Out-File -FilePath $reportPath -Encoding UTF8
    Write-Host "Report generated: $reportPath" -ForegroundColor Green
}
```

---

## 🎯 How to Use Cursor Throughout Your Journey

### **Week 1-2: Foundation Building**
**Daily Cursor Interactions:**
- "Explain this PowerShell command in simple terms"
- "Create a beginner-friendly example of [concept]"
- "What does this error message mean and how do I fix it?"

### **Week 3-4: Concept Mastery**
**Daily Cursor Interactions:**
- "Build a practical example using if statements"
- "Create a loop that processes multiple files"
- "Help me debug this script"

### **Week 5-8: Project Building**
**Daily Cursor Interactions:**
- "Create a script that automates [specific task]"
- "Review my code for best practices"
- "How can I make this script more efficient?"

### **Week 9-12: Advanced Automation**
**Daily Cursor Interactions:**
- "Help me integrate this API into my script"
- "Create a professional-looking report generator"
- "Build a complete automation solution for [use case]"

---

## 🏆 Your PowerShell Guru Skills Checklist

### **Beginner Level (Week 1-4) ✅**
- [ ] Can navigate file system with PowerShell
- [ ] Understand variables and basic data types
- [ ] Can write simple if statements and loops
- [ ] Built first automation script

### **Intermediate Level (Week 5-8) ✅**
- [ ] Master file operations and text processing
- [ ] Create reusable functions
- [ ] Handle errors gracefully
- [ ] Generate automated reports

### **Advanced Level (Week 9-12) ✅**
- [ ] Integrate with web APIs
- [ ] Create scheduled tasks
- [ ] Build complete automation solutions
- [ ] Work with databases and external data

### **Guru Level (Week 13+) 🚀**
- [ ] Built comprehensive system toolkit
- [ ] Created professional automation solutions
- [ ] Can solve complex problems with PowerShell
- [ ] Teaching others PowerShell concepts

---

## 💡 Daily Practice Routine

### **Morning (15 minutes)**
- Review previous day's concepts
- Run through basic commands
- Ask Cursor one learning question

### **Main Session (30-45 minutes)**
- Follow day's curriculum
- Complete hands-on exercises
- Build/modify scripts

### **Evening (15 minutes)**
- Test what you built
- Document your learning
- Plan tomorrow's focus

---

## 🚀 Success Tips for Non-Developers

### **1. Start Small, Think Big**
- Begin with simple file operations
- Gradually add complexity
- Always have a real-world use case in mind

### **2. Practice Daily**
- Consistency beats intensity
- Even 15 minutes daily makes a difference
- Use Cursor to maintain momentum

### **3. Focus on Practical Applications**
- Automate tasks you do manually
- Solve real problems in your work
- Build tools that save you time

### **4. Don't Fear Errors**
- Errors are learning opportunities
- Use Cursor to understand what went wrong
- Every expert was once a beginner

### **5. Build a Portfolio**
- Save all your scripts
- Document what each script does
- Share your successes with others

---

## 🎯 After 90 Days: Your PowerShell Superpower

**You'll be able to:**
- ✅ Automate repetitive tasks in minutes
- ✅ Create professional system reports
- ✅ Build complete automation solutions
- ✅ Troubleshoot system issues like a pro
- ✅ Integrate with web services and APIs
- ✅ Schedule automated maintenance tasks
- ✅ Impress colleagues with your efficiency

**Career Impact:**
- 🚀 Increased productivity and efficiency
- 🚀 New opportunities in system administration
- 🚀 Problem-solving skills highly valued by employers
- 🚀 Foundation for learning other programming languages

---

## 🌟 Welcome to Your PowerShell Journey!

**Remember**: Every PowerShell guru started exactly where you are now. The only difference between you and them is they started their journey. 

**Your first action**: Open PowerShell and run this command:
```powershell
Write-Host "I am starting my PowerShell journey today!" -ForegroundColor Green
```

**With Cursor as your learning partner and this comprehensive guide, you have everything you need to become a PowerShell guru in just 90 days!**

🚀 **Start today. Your future automated self will thank you!** 🚀