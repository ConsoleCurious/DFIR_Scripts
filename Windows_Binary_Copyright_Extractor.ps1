# Define the directory to scan and output CSV file path
$directoryPath = "C:\path\to\your\directory"
$outputCsvPath = "C:\path\to\output\file_info.csv"

# Check if the directory exists
if (!(Test-Path -Path $directoryPath)) {
    Write-Host "The specified directory does not exist."
    exit
}

# Initialize an empty array to store file information
$fileInfoList = @()

# Get all .exe files in the directory recursively
Get-ChildItem -Path $directoryPath -Filter "*.exe" -Recurse | ForEach-Object {
    $file = $_

    # Calculate the MD5 hash of the file
    $md5Hash = (Get-FileHash -Algorithm MD5 -Path $file.FullName).Hash

    # Retrieve the copyright information
    $copyright = (Get-Item $file.FullName).VersionInfo.LegalCopyright

    # Add file information to the array
    $fileInfoList += [PSCustomObject]@{
        FileName   = $file.Name
        FilePath   = $file.FullName
        MD5Hash    = $md5Hash
        Copyright  = if ($copyright) { $copyright } else { "No Copyright Information" }
    }
}

# Export the file information to a CSV file
$fileInfoList | Export-Csv -Path $outputCsvPath -NoTypeInformation -Encoding UTF8

Write-Host "File information has been saved to $outputCsvPath"
# Check if the directory exists
if (!(Test-Path -Path $directoryPath)) {
    Write-Host "The specified directory does not exist."
    exit
}

# Get all .exe files in the directory
Get-ChildItem -Path $directoryPath -Filter "*.exe" | ForEach-Object {
    $file = $_
    # Retrieve the copyright information
    $copyright = (Get-Item $file.FullName).VersionInfo.LegalCopyright

    # Output the filename and copyright information
    [PSCustomObject]@{
        FileName   = $file.Name
        Copyright  = if ($copyright) { $copyright } else { "No Copyright Information" }
    }
} | Format-Table -AutoSize