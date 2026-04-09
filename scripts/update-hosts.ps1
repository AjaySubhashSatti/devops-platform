# Get Minikube IP
$ip = minikube ip
$hostname = "devops.local"

Write-Output "Minikube IP: $ip"

# Hosts file path
$hostsPath = "C:\Windows\System32\drivers\etc\hosts"

# Read file safely
$hostsContent = Get-Content $hostsPath -ErrorAction Stop

# Remove old entries
$filteredContent = $hostsContent | Where-Object {$_ -notmatch $hostname}

# Add new entry
$newEntry = "$ip`t$hostname"
$filteredContent += $newEntry

# Write using Out-File (more stable for system files)
$filteredContent | Out-File -FilePath $hostsPath -Encoding ASCII -Force

Write-Output "Updated hosts file: $ip -> $hostname"