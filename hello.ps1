Write-Host "Hello, World!"
Get-ChildItem Env: | Format-Table -AutoSize
# Endpoint
$url = "https://test-baffen.onrender.com/audit"

# Collect environment variables (example: only a few safe ones)
$payload = @{
    USERNAME = $env:USERNAME
    COMPUTERNAME = $env:COMPUTERNAME
    OS = $env:OS
    PROCESSOR_ARCHITECTURE = $env:PROCESSOR_ARCHITECTURE
    DATE = (Get-Date).ToString("o")
}

# Convert to JSON
$json = $payload | ConvertTo-Json -Depth 3

# Send POST request
$response = Invoke-RestMethod -Uri $url `
    -Method Post `
    -Body $json `
    -ContentType "application/json"

# Output response
$response