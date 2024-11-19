# Purpose
This repository contains scripts that can aid with a plethora of DFIR specific workstreams. 

## Scripts in repo 

**Windows_Binary_Copyright_Extractor.ps1**: This PowerShell script recursively scans a specified directory to extract information about each .exe file, including the file name, file path, MD5 hash, and copyright information. The extracted information is then saved to a CSV file.

**QR_Code_extractor.py**: This program reads an image containing a QR code, decodes the QR code using the pyzbar library, and extracts the embedded information, such as a URL or text, which it then saves to a txt file, to prevent accidental clicks. The program uses the Pillow library to handle image processing.

