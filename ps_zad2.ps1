While(1)
{
    try
    {
        choco install dotnetcore-sdk
    }
    catch
    {
        Set-ExecutionPolicy RemoteSigned
        iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
        choco install dotnetcore-sdk
    }
    $choice = Read-Host "What are you want?"
    $mass = $choice -split " "
    switch($mass[0])
    {
        --autoupgrade
        {
            schtasks /create /tn "Upgrade" /tr C:\Users\Admin\Desktop\универ\DevOps\PowerShell_scripts\test.ps1 /sc daily /mo $mass[1] /sd 10/11/2019 /st 13:00
            
            break
        }
        -uninstall
        {
            try
            {
                choco uninstall dotnetcore-sdk
            }
            catch{}
            try
            {
                schtasks /delete /tn "Upgrade"
            }
            catch{}
            break
        }
        Get-Help
        {
            Write-Host "--autoupgrade argument - script create daily schedule for running sh > choco upgrade dotnetcore-sdk command `n--uninstall argument - uninstall dotnetcore-sdk , chocolately, and scheduler (if exist)"
            break
        }
        Default
        {
            Write-Host "Something went wrong. Call the Get-Help command"
        }
    }
    $i = Read-Host "Do you want to continue?[... , No]"
    if($i -eq 'No')
    {
        break
    }
}