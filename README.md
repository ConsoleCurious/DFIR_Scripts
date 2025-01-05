# Purpose
This repository contains scripts that can aid with a plethora of DFIR specific workstreams. 

## Scripts in repo 

**Windows_Binary_Copyright_Extractor.ps1**: This PowerShell script recursively scans a specified directory to extract information about each .exe file, including the file name, file path, MD5 hash, and copyright information. The extracted information is then saved to a CSV file.

**QR_Code_extractor.py**: This Python script reads an image containing a QR code, decodes the QR code using the pyzbar library, and extracts the embedded information, such as a URL or text, which it then saves to a txt file, to prevent accidental clicks.

**Email_Headers_Extractor_msg.py**: This Python script recursively searches for .msg email files in a specified directory and its subdirectories. It extracts the email headers from each file, along with the file name and path. The output is saved to a CSV file.

**Recursive_File_Metadata_Enumeration.ps1**: This PowerShell script recursively scans a specified directory to collect detailed metadata about each file, including the file's path, name, size, creation and modification times, owner, and MD5 hash. The collected information is exported to a CSV file for analysis or reporting, making it useful for auditing, forensic investigations, or file management tasks.
