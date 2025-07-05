# PowerShell Fundamentals Training Session 1
# Your Personal Trainer: Let's master the basics! 🚀

Write-Host "=== POWERSHELL FUNDAMENTALS TRAINING ===" -ForegroundColor Cyan
Write-Host "Session 1: Core Concepts & Hands-On Practice" -ForegroundColor Yellow
Write-Host "Trainer: Your AI PowerShell Coach" -ForegroundColor Green

# ===== LESSON 1: UNDERSTANDING POWERSHELL =====
Write-Host "`n--- LESSON 1: What is PowerShell? ---" -ForegroundColor Magenta

Write-Host "PowerShell is:" -ForegroundColor Yellow
Write-Host "  • A command-line shell AND scripting language"
Write-Host "  • Object-oriented (not just text like DOS)"
Write-Host "  • Cross-platform (Windows, Linux, macOS)"
Write-Host "  • Perfect for automation and system administration"

Write-Host "`n🎯 TRAINER TIP: Everything in PowerShell is an OBJECT with properties and methods!" -ForegroundColor Green

# ===== LESSON 2: BASIC COMMANDS (CMDLETS) =====
Write-Host "`n--- LESSON 2: Basic Commands (Cmdlets) ---" -ForegroundColor Magenta

Write-Host "PowerShell commands follow Verb-Noun pattern:" -ForegroundColor Yellow
Write-Host "  • Get-Process (Get information about processes)"
Write-Host "  • Set-Location (Change directory)"
Write-Host "  • New-Item (Create files/folders)"
Write-Host "  • Remove-Item (Delete files/folders)"

Write-Host "`n🏋️ EXERCISE 1: Let's try basic commands" -ForegroundColor Green
Write-Host "Current location: $(Get-Location)"
Write-Host "Current date: $(Get-Date)"
Write-Host "Your computer name: $env:COMPUTERNAME"
Write-Host "Your username: $env:USERNAME"

# ===== LESSON 3: VARIABLES =====
Write-Host "`n--- LESSON 3: Variables (Storing Information) ---" -ForegroundColor Magenta

Write-Host "Variables in PowerShell start with $ symbol:" -ForegroundColor Yellow

# String variables
$myName = "PowerShell Student"
$computerName = $env:COMPUTERNAME
$todaysDate = Get-Date

Write-Host "String variable: $myName"
Write-Host "System variable: $computerName"
Write-Host "Command result in variable: $todaysDate"

# Number variables
$number1 = 100
$number2 = 25
$result = $number1 + $number2

Write-Host "Math with variables: $number1 + $number2 = $result"

# Array variables
$colors = @("Red", "Blue", "Green", "Yellow")
$numbers = @(1, 2, 3, 4, 5)

Write-Host "Array of colors: $($colors -join ', ')"
Write-Host "Array of numbers: $($numbers -join ', ')"

Write-Host "`n🎯 TRAINER TIP: Use $() to execute commands inside strings!" -ForegroundColor Green

# ===== LESSON 4: WORKING WITH OBJECTS =====
Write-Host "`n--- LESSON 4: Objects and Properties ---" -ForegroundColor Magenta

Write-Host "Getting file information as objects:" -ForegroundColor Yellow
$files = Get-ChildItem | Select-Object -First 3

Write-Host "Files in current directory:"
foreach ($file in $files) {
    Write-Host "  Name: $($file.Name)"
    Write-Host "  Size: $($file.Length) bytes"
    Write-Host "  Modified: $($file.LastWriteTime)"
    Write-Host "  ---"
}

Write-Host "`n🎯 TRAINER TIP: Objects have properties (Name, Size) and methods (actions)!" -ForegroundColor Green

# ===== LESSON 5: THE PIPELINE =====
Write-Host "`n--- LESSON 5: The PowerShell Pipeline ---" -ForegroundColor Magenta

Write-Host "Pipeline passes objects between commands using |" -ForegroundColor Yellow

# Example: Get processes, filter by CPU usage, sort by name
$highCpuProcesses = Get-Process | Where-Object {$_.CPU -gt 1} | Sort-Object Name | Select-Object -First 5

Write-Host "Top 5 processes with CPU > 1:"
$highCpuProcesses | ForEach-Object {
    Write-Host "  $($_.Name): CPU = $($_.CPU)"
}

Write-Host "`n🎯 TRAINER TIP: Pipeline is PowerShell's superpower - chain commands together!" -ForegroundColor Green

# ===== LESSON 6: CONDITIONAL LOGIC =====
Write-Host "`n--- LESSON 6: Making Decisions (If Statements) ---" -ForegroundColor Magenta

$currentHour = (Get-Date).Hour

if ($currentHour -lt 12) {
    Write-Host "Good morning! Time to learn PowerShell!" -ForegroundColor Green
} elseif ($currentHour -lt 17) {
    Write-Host "Good afternoon! Keep practicing!" -ForegroundColor Yellow
} else {
    Write-Host "Good evening! Great time for automation!" -ForegroundColor Blue
}

# Check disk space
$cDrive = Get-WmiObject -Class Win32_LogicalDisk -Filter "DeviceID='C:'"
$freeSpacePercent = [math]::Round(($cDrive.FreeSpace / $cDrive.Size) * 100, 2)

Write-Host "`nDisk Space Check:"
if ($freeSpacePercent -lt 10) {
    Write-Host "⚠️  WARNING: C: drive is $freeSpacePercent% free - Clean up needed!" -ForegroundColor Red
} elseif ($freeSpacePercent -lt 20) {
    Write-Host "⚡ CAUTION: C: drive is $freeSpacePercent% free - Consider cleanup" -ForegroundColor Yellow
} else {
    Write-Host "✅ GOOD: C: drive is $freeSpacePercent% free - All good!" -ForegroundColor Green
}

# ===== LESSON 7: LOOPS =====
Write-Host "`n--- LESSON 7: Loops (Repeating Actions) ---" -ForegroundColor Magenta

Write-Host "ForEach Loop - Process multiple items:" -ForegroundColor Yellow

$fileExtensions = @(".txt", ".docx", ".pdf", ".jpg", ".mp3")
Write-Host "File extension analysis:"
foreach ($ext in $fileExtensions) {
    $fileCount = (Get-ChildItem "*$ext" -ErrorAction SilentlyContinue).Count
    Write-Host "  $ext files: $fileCount"
}

Write-Host "`nFor Loop - Count with numbers:" -ForegroundColor Yellow
Write-Host "Countdown: " -NoNewline
for ($i = 5; $i -ge 1; $i--) {
    Write-Host "$i... " -NoNewline -ForegroundColor Red
    Start-Sleep -Seconds 1
}
Write-Host "🚀 Launch!" -ForegroundColor Green

# ===== PRACTICAL EXERCISE =====
Write-Host "`n--- PRACTICAL EXERCISE: Your First Automation ---" -ForegroundColor Magenta

Write-Host "Let's create a system information report!" -ForegroundColor Yellow

# Gather system information
$systemInfo = @{
    ComputerName = $env:COMPUTERNAME
    UserName = $env:USERNAME
    Date = Get-Date
    OSVersion = (Get-ComputerInfo).WindowsProductName
    PowerShellVersion = $PSVersionTable.PSVersion
    TotalRAM = [math]::Round((Get-ComputerInfo).TotalPhysicalMemory / 1GB, 2)
    ProcessCount = (Get-Process).Count
    ServiceCount = (Get-Service).Count
}

Write-Host "`n=== SYSTEM INFORMATION REPORT ===" -ForegroundColor Cyan
Write-Host "Computer: $($systemInfo.ComputerName)"
Write-Host "User: $($systemInfo.UserName)"
Write-Host "Date: $($systemInfo.Date)"
Write-Host "OS: $($systemInfo.OSVersion)"
Write-Host "PowerShell Version: $($systemInfo.PowerShellVersion)"
Write-Host "Total RAM: $($systemInfo.TotalRAM) GB"
Write-Host "Running Processes: $($systemInfo.ProcessCount)"
Write-Host "Total Services: $($systemInfo.ServiceCount)"

# ===== TRAINING SUMMARY =====
Write-Host "`n🎓 TRAINING SESSION 1 COMPLETE!" -ForegroundColor Green
Write-Host "You've learned:" -ForegroundColor Yellow
Write-Host "  ✅ PowerShell basics and cmdlets"
Write-Host "  ✅ Variables and data types"
Write-Host "  ✅ Working with objects"
Write-Host "  ✅ The pipeline concept"
Write-Host "  ✅ Conditional logic (if statements)"
Write-Host "  ✅ Loops (foreach, for)"
Write-Host "  ✅ Created your first automation script"

Write-Host "`n🚀 NEXT STEPS:" -ForegroundColor Cyan
Write-Host "1. Practice these concepts"
Write-Host "2. Ask your trainer: 'Create a file organization script'"
Write-Host "3. Ready for Session 2: Advanced Automation"

Write-Host "`n💡 HOMEWORK:" -ForegroundColor Yellow
Write-Host "Try to modify this script:"
Write-Host "  - Add your favorite color to a variable"
Write-Host "  - Create a loop that counts from 1 to 10"
Write-Host "  - Add a condition to check if it's a weekend"

Write-Host "`n🎯 Remember: You're not just learning commands - you're building automation superpowers!" -ForegroundColor Green