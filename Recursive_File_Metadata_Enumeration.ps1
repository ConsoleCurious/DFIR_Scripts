# Define the directory to scan and the output CSV file
$directory = "C:\Path\To\Directory"
$outputCsv = "C:\Path\To\FileMetadata.csv"

# Initialize an array to store file metadata
$fileMetadata = @()

# Recursively get all files in the directory
$files = Get-ChildItem -Path $directory -Recurse -File -Force

# Loop through each file
foreach ($file in $files) {
    try {
        # Get file owner
        $owner = (Get-Acl -Path $file.FullName).Owner

        # Get MD5 hash
        $hash = Get-FileHash -Path $file.FullName -Algorithm MD5 | Select-Object -ExpandProperty Hash

        # Get other file properties
        $fileInfo = @{
            Path         = $file.FullName
            Name         = $file.Name
            Extension    = $file.Extension
            SizeBytes    = $file.Length
            CreationTime = $file.CreationTime
            LastWriteTime = $file.LastWriteTime
            Owner        = $owner
            MD5Hash      = $hash
        }

        # Add the metadata to the array
        $fileMetadata += [PSCustomObject]$fileInfo
    } catch {
        # Handle errors and log the issue
        $fileMetadata += [PSCustomObject]@{
            Path         = $file.FullName
            Name         = $file.Name
            Extension    = $file.Extension
            SizeBytes    = $null
            CreationTime = $null
            LastWriteTime = $null
            Owner        = "Error: $($_.Exception.Message)"
            MD5Hash      = "Error"
        }
    }
}

# Export the metadata to a CSV file
$fileMetadata | Export-Csv -Path $outputCsv -NoTypeInformation

Write-Output "Metadata exported to $outputCsv"