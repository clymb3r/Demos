function Get-ChildItemProxy1
{
    Param(
        [Parameter(Position = 1, Mandatory=$true)]
        [String]
        $Path
    )

    Invoke-Expression "Get-ChildItem '$Path'"
}

function Get-ChildItemProxy2
{
    Param(
        [Parameter(Position = 1, Mandatory=$true)]
        [String]
        $Path
    )

    if ($Path -imatch "'")
    {
        Write-Error "Invalid character detected!" -ErrorAction Stop
    }

    Invoke-Expression "Get-ChildItem '$Path'"
}

#This is the correct way to write the code.
function Get-ChildItemProxy3
{
    Param(
        [Parameter(Position = 1, Mandatory=$true)]
        [String]
        $Path
    )

    Get-ChildItem $Path
}