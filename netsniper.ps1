arp -a #prints out all mac addresses

$macInput = Read-Host -Prompt 'Please enter the MAC Address you want to monitor (in 00-00-00-00-00-00 format)'
write-host "You input the MAC address" $macInput

