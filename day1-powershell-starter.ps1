# Day 1 PowerShell Starter Script
# Welcome to your PowerShell journey! 🚀

# Display a welcome message
Write-Host "🎉 Welcome to your PowerShell journey!" -ForegroundColor Green
Write-Host "Today is Day 1 of your path to becoming a PowerShell guru!" -ForegroundColor Cyan
Write-Host "Let's start with some basic commands..." -ForegroundColor Yellow

# Command 1: Get today's date and time
Write-Host "`n--- Command 1: Get Date and Time ---" -ForegroundColor Magenta
$currentDate = Get-Date
Write-Host "Current date and time: $currentDate"

# Command 2: Get your computer information
Write-Host "`n--- Command 2: Computer Information ---" -ForegroundColor Magenta
Write-Host "Computer name: $env:COMPUTERNAME"
Write-Host "Current user: $env:USERNAME"
Write-Host "Operating System: $((Get-ComputerInfo).WindowsProductName)"

# Command 3: List files in your current directory
Write-Host "`n--- Command 3: List Files ---" -ForegroundColor Magenta
$files = Get-ChildItem
Write-Host "Files in current directory: $($files.Count)"
Write-Host "First 5 files:"
$files | Select-Object -First 5 | ForEach-Object { Write-Host "  - $($_.Name)" }

# Command 4: Get running processes (top 5 by CPU usage)
Write-Host "`n--- Command 4: Running Processes ---" -ForegroundColor Magenta
$topProcesses = Get-Process | Sort-Object CPU -Descending | Select-Object -First 5
Write-Host "Top 5 processes by CPU usage:"
$topProcesses | ForEach-Object { Write-Host "  - $($_.Name): $($_.CPU) CPU" }

# Command 5: Simple calculation
Write-Host "`n--- Command 5: Simple Math ---" -ForegroundColor Magenta
$number1 = 10
$number2 = 5
$result = $number1 + $number2
Write-Host "$number1 + $number2 = $result"

# Command 6: Working with variables
Write-Host "`n--- Command 6: Variables ---" -ForegroundColor Magenta
$myFavoriteColor = "Blue"
$myAge = 25
Write-Host "My favorite color is $myFavoriteColor"
Write-Host "I am $myAge years old"

# Command 7: Get disk space information
Write-Host "`n--- Command 7: Disk Space ---" -ForegroundColor Magenta
$diskInfo = Get-WmiObject -Class Win32_LogicalDisk | Select-Object DeviceID, Size, FreeSpace
foreach ($disk in $diskInfo) {
    if ($disk.Size -gt 0) {
        $freeSpaceGB = [math]::Round($disk.FreeSpace / 1GB, 2)
        $totalSpaceGB = [math]::Round($disk.Size / 1GB, 2)
        Write-Host "Drive $($disk.DeviceID) - Free: $freeSpaceGB GB, Total: $totalSpaceGB GB"
    }
}

# Congratulations message
Write-Host "`n🎉 Congratulations! You've completed your first PowerShell commands!" -ForegroundColor Green
Write-Host "You've just:" -ForegroundColor Yellow
Write-Host "  ✅ Displayed information about your computer"
Write-Host "  ✅ Worked with variables"
Write-Host "  ✅ Listed files and processes"
Write-Host "  ✅ Performed calculations"
Write-Host "  ✅ Checked disk space"

Write-Host "`n🚀 Ready for Day 2? Keep going - you're doing great!" -ForegroundColor Cyan
Write-Host "Remember: Every PowerShell expert started exactly where you are now!" -ForegroundColor Green

# Ask Cursor for next steps
Write-Host "`n💡 Next steps:" -ForegroundColor Yellow
Write-Host "1. Try modifying the variables in this script"
Write-Host "2. Ask Cursor: 'Explain how PowerShell variables work'"
Write-Host "3. Ask Cursor: 'Create a simple script to organize my files'"
Write-Host "4. Practice these commands until you feel comfortable"

Write-Host "`nPress any key to continue..." -ForegroundColor White
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")