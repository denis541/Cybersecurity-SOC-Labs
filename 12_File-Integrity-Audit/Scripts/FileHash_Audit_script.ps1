# get the paths to the files 
# save to a file as a .ps1 extension
$file1 = Read-Host -Prompt "Enter the path for the first file"
$file2 = Read-Host -Prompt "Enter the path for the second file"

# Remove quotes if you pasted the path with them (common when copying from Explorer)
$file1 = $file1.Trim('"')
$file2 = $file2.Trim('"')

# Calculate hashes
$hash1 = (Get-FileHash -Path $file1).Hash
$hash2 = (Get-FileHash -Path $file2).Hash

# Compare and output results
if ($hash1 -eq $hash2) {
    Write-Host "MATCH: The files are identical." -ForegroundColor Green
} else {
    Write-Host "MISMATCH: The files are different!" -ForegroundColor Red
}

# Keep the window open so you can read the result
# makes the computer wait for input from the user 
Read-Host "Press Enter to exit"
