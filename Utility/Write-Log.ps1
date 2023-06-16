function Write-Log {
    param (
        [Parameter(Mandatory = $true, Position = 0)]
        [string]$Message#,
        
        #[string]$LogPath = $script:logpath
    )
    Write-Output "[$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')] [$((Get-PSCallStack)[1].Command)] $Message" # | Out-File -FilePath $LogPath -Append
}
