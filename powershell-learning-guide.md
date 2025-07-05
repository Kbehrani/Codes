# PowerShell Learning Guide: From Zero to Hero with Cursor

## 🎯 What is PowerShell?

PowerShell is a **task automation and configuration management framework** that includes:
- **Command-line shell** (like Command Prompt, but much more powerful)
- **Scripting language** (for automation and complex tasks)
- **Administrative tool** (for managing Windows, Linux, and macOS)

**Key advantage**: PowerShell works with .NET objects, not just text like traditional shells.

## 🚀 Phase 1: Getting Started (Week 1-2)

### **Installation & Setup**
```powershell
# Check if PowerShell is installed
$PSVersionTable

# Install PowerShell 7+ (cross-platform)
# Windows: winget install Microsoft.PowerShell
# Linux: sudo apt install powershell
# macOS: brew install powershell
```

### **Essential Concepts to Learn First**
1. **Cmdlets** - PowerShell commands (Verb-Noun format)
2. **Objects** - Everything is an object, not just text
3. **Pipeline** - Passing objects between commands
4. **Help System** - Built-in documentation
5. **Variables** - Storing and manipulating data

### **Your First PowerShell Commands**
```powershell
# Get help for any command
Get-Help Get-Process

# List running processes
Get-Process

# Get system information
Get-ComputerInfo

# List files and folders
Get-ChildItem

# Create a variable
$myVariable = "Hello PowerShell"
Write-Output $myVariable
```

## 🛠️ How Cursor Dramatically Accelerates PowerShell Learning

### **1. Interactive Learning with Real-time Feedback**
**Traditional Way**: Read documentation → Try command → Debug errors → Repeat
**Cursor Way**: Ask Cursor to explain and demonstrate concepts with working examples

### **2. Instant Script Creation & Testing**
```powershell
# Cursor can create scripts for you instantly
# Example: "Create a PowerShell script to backup files"
```

### **3. Debugging & Error Explanation**
- Cursor can explain PowerShell error messages in plain English
- Provides immediate fixes for common issues
- Shows multiple ways to solve the same problem

### **4. Best Practices Integration**
- Cursor knows PowerShell best practices and applies them automatically
- Helps with proper error handling, parameter validation, and code structure

## 📚 Phase 2: Core Concepts (Week 3-4)

### **Essential PowerShell Concepts**

#### **1. Working with Objects**
```powershell
# Everything is an object
$processes = Get-Process
$processes | Get-Member  # See available properties and methods

# Select specific properties
Get-Process | Select-Object Name, CPU, WorkingSet
```

#### **2. The Pipeline**
```powershell
# Chain commands together
Get-Process | Where-Object {$_.CPU -gt 100} | Sort-Object CPU -Descending
```

#### **3. Variables and Data Types**
```powershell
$string = "Hello"
$number = 42
$array = @(1, 2, 3, 4, 5)
$hashtable = @{Name="John"; Age=30}
```

#### **4. Control Structures**
```powershell
# If statements
if ($number -gt 10) {
    Write-Output "Number is greater than 10"
}

# Loops
foreach ($item in $array) {
    Write-Output $item
}
```

## 🎯 Phase 3: Practical Projects (Week 5-8)

### **Beginner Projects to Build**

#### **1. System Information Script**
```powershell
# Get comprehensive system info
$info = @{
    ComputerName = $env:COMPUTERNAME
    OS = (Get-WmiObject -Class Win32_OperatingSystem).Caption
    TotalRAM = [math]::Round((Get-WmiObject -Class Win32_ComputerSystem).TotalPhysicalMemory / 1GB, 2)
    FreeSpace = [math]::Round((Get-WmiObject -Class Win32_LogicalDisk -Filter "DriveType=3" | Measure-Object -Property FreeSpace -Sum).Sum / 1GB, 2)
}
$info
```

#### **2. File Management Automation**
```powershell
# Organize files by extension
$sourceFolder = "C:\Downloads"
$files = Get-ChildItem -Path $sourceFolder -File
foreach ($file in $files) {
    $extension = $file.Extension
    $destFolder = "$sourceFolder\$extension"
    if (!(Test-Path $destFolder)) {
        New-Item -Path $destFolder -ItemType Directory
    }
    Move-Item -Path $file.FullName -Destination $destFolder
}
```

#### **3. Service Monitor**
```powershell
# Monitor critical services
$criticalServices = @("Spooler", "BITS", "Themes")
foreach ($service in $criticalServices) {
    $serviceStatus = Get-Service -Name $service
    if ($serviceStatus.Status -ne "Running") {
        Write-Warning "$service is not running!"
        # Start-Service -Name $service  # Uncomment to auto-start
    }
}
```

## 🚀 How to Use Cursor for PowerShell Learning

### **Cursor Learning Strategies**

#### **1. Explain-by-Example**
Ask Cursor:
- "Explain PowerShell objects with a practical example"
- "Show me how to use Where-Object with real data"
- "Create a script that demonstrates the PowerShell pipeline"

#### **2. Interactive Debugging**
```powershell
# When you get an error, ask Cursor:
# "Why am I getting this error and how do I fix it?"
# Cursor will explain the error and provide solutions
```

#### **3. Project-Based Learning**
- "Create a PowerShell script to clean up old files"
- "Build a system health check script"
- "Make a script to manage Windows services"

#### **4. Best Practices Learning**
- "Review my PowerShell script for best practices"
- "How can I make this script more efficient?"
- "Add proper error handling to this script"

## 📊 Phase 4: Advanced Topics (Month 2-3)

### **Advanced PowerShell Concepts**

#### **1. Functions and Modules**
```powershell
# Create reusable functions
function Get-DiskUsage {
    param([string]$ComputerName = $env:COMPUTERNAME)
    
    Get-WmiObject -Class Win32_LogicalDisk -ComputerName $ComputerName |
    Select-Object DeviceID, 
        @{Name="Size(GB)"; Expression={[math]::Round($_.Size / 1GB, 2)}},
        @{Name="FreeSpace(GB)"; Expression={[math]::Round($_.FreeSpace / 1GB, 2)}},
        @{Name="PercentFree"; Expression={[math]::Round(($_.FreeSpace / $_.Size) * 100, 2)}}
}
```

#### **2. Error Handling**
```powershell
try {
    Get-Process -Name "NonExistentProcess" -ErrorAction Stop
}
catch {
    Write-Error "Process not found: $($_.Exception.Message)"
}
finally {
    Write-Output "Cleanup code here"
}
```

#### **3. Working with APIs and Web Services**
```powershell
# REST API calls
$response = Invoke-RestMethod -Uri "https://api.github.com/users/octocat"
$response.name
```

## 🎯 Cursor's Unique PowerShell Advantages

### **1. Real-time Script Testing**
- Cursor can run PowerShell commands and show you results instantly
- No need to switch between documentation and terminal

### **2. Cross-platform Compatibility**
- Cursor helps ensure your scripts work on Windows, Linux, and macOS
- Identifies platform-specific issues and provides alternatives

### **3. Integration with Other Tools**
- Cursor can help you integrate PowerShell with other tools in your workflow
- Examples: Git, Docker, Azure CLI, AWS CLI

### **4. Learning Path Customization**
- Cursor adapts to your learning style and pace
- Provides personalized examples based on your interests

## 📈 Learning Schedule with Cursor

### **Week 1-2: Foundation**
- 30 minutes daily with Cursor
- Focus: Basic commands, help system, simple scripts
- Cursor tasks: "Explain this command", "Create a simple script"

### **Week 3-4: Core Concepts**
- 45 minutes daily
- Focus: Objects, pipeline, variables, control structures
- Cursor tasks: "Build practical examples", "Debug my code"

### **Week 5-8: Projects**
- 1 hour daily
- Focus: Building real automation scripts
- Cursor tasks: "Create project scripts", "Review and improve code"

### **Month 2-3: Advanced**
- 1 hour daily
- Focus: Functions, modules, advanced techniques
- Cursor tasks: "Build complex solutions", "Optimize performance"

## 🎯 PowerShell vs Other Shells

### **PowerShell Advantages:**
- **Object-oriented** (not just text)
- **Consistent syntax** (Verb-Noun cmdlets)
- **Extensive help system** (Get-Help for everything)
- **Cross-platform** (Windows, Linux, macOS)
- **Strong typing** and rich data structures

### **When to Use PowerShell:**
- Windows administration
- Automation tasks
- System management
- Working with .NET applications
- Complex data processing

## 💡 Final Tips for Success

### **1. Start Simple**
- Begin with basic file operations
- Gradually add complexity
- Use Cursor to explain each step

### **2. Practice Daily**
- Even 15 minutes daily with Cursor
- Focus on practical tasks you actually need

### **3. Leverage Cursor's Strengths**
- Ask for explanations in plain English
- Request multiple solutions to the same problem
- Use Cursor to debug and optimize your scripts

### **4. Build Real Projects**
- Automate tasks you do manually
- Create tools for your workflow
- Share scripts with others

## 🚀 Your PowerShell Journey Starts Now!

**With Cursor as your learning companion**, you can:
- Learn PowerShell concepts faster with interactive examples
- Build real scripts from day one
- Get instant help when stuck
- Follow best practices from the beginning

**Start today**: Open Cursor and ask it to create your first PowerShell script. The journey from PowerShell beginner to automation expert starts with a single command! 

Remember: **Every PowerShell expert was once a beginner who didn't give up.** 🎯