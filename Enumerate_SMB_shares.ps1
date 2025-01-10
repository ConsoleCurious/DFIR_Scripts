# Enumerate SMB shares and their permissions, then export to a CSV file
Get-SmbShare | ForEach-Object {
    $share = $_
    Get-SmbShareAccess -Name $share.Name | Select-Object @{Name='ShareName';Expression={$share.Name}}, AccountName, AccessControlType, AccessRight
} | Export-Csv -Path "SMB_Shares_Permissions.csv" -NoTypeInformation