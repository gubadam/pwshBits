function Group-ObjectNoSort {
    [CmdletBinding()]
    param (
        [Parameter(ValueFromPipeline = $true)]
        $InputObject,
        [Parameter(Mandatory = $true)]
        $Property
    )

    begin {
        $groups = @{}
    }

    process {
        $value = $InputObject.$Property
        if (!$groups.ContainsKey($value)) {
            $groups[$value] = @()
        }
        $groups[$value] += $InputObject
    }

    end {
        $groups
    }
}

$groups = @(@{name='b'},@{name='a'},@{name='c'}) | Group-ObjectNoSort -Property name