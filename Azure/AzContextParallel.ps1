#Requires -Version 7.3 

Connect-AzAccount

# Input data
$subscriptionList = Get-AzSubscription | Get-Random -Count 100

# Prepare AzContext list before actual processing to avoid concurrancy issues
$contextList = $subscriptionList | ForEach-Object { Set-AzContext $_ }

# Process
$contextList | ForEach-Object -UseNewRunspace -ThrottleLimit 5 -Parallel {
    # Use '-DefaultProfile $context' with *-Az* cmdlets to leverage previously saved context
    $context = $_
    Get-AzContext -DefaultProfile $context
}