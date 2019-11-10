While(1)
{
    $name = Read-Host "What are you want?"
    switch($name)
    {
        --users
        {
            net user
            break
        }
        --sessions
        {
            Get-WmiObject Win32_LoggedOnUser 
            break
        }
        --processes
        {
            try
            {
                Get-Process | Format-Table k
                break
            }
            catch
            {
                Write-Host Users flag are not specified
            }
        }
        Get-Help
        {
            Write-Host --users - display all users on your desctop `n--sessions - display all active sessions on local computer `n--processes - [ACCEPTABLE ONLY IF USERS FLAG SPECIFIED] get processes runned by --users
        }
        Default
        {
            Write-Host Something went wrong. Call the Get-Help command
        }
    }
    $i = Read-Host Do you want to continue?[Yes,No]
    if($i -eq 'No')
    {
        break
    }
}
