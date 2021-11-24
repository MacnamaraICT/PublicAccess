Add-Type -AssemblyName PresentationFramework

$rebootFilePath = "C:\Macnamara\reboot.txt" 
$rebootFile = Get-Content $rebootFilePath 
$prompt = "New security software has been installed which requires a restart of this computer to complete. Can we restart now? If not, we'll ask again in 1 hour"

if ($rebootFile -match "1") { 
    $answer = [System.Windows.MessageBox]::Show($prompt, "Macnamara Reboot Prompt", "YesNo", "Warning")
    if ($answer-eq "Yes") { 
        $rebootFile -replace "1","0" | Set-Content -Path $rebootFilePath
        Restart-Computer -Force
    }
} else { 
    Exit 0 
    
}
