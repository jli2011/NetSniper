arp -a #prints out all mac addresses

$macInput = Read-Host -Prompt 'Please enter the MAC Address you want to monitor (in 00-00-00-00-00-00 format)' #prompts user to input the mac address to monitor
write-host "You input the MAC address" $macInput #displays user input for user to double check

#sends an email to specified address
$EmailServer = "careercenter.colo.hawaii.edu" #smtp server name
Send-MailMessage -From "jiajie@hawaii.edu" -To "jiajie@hawaii.edu" -Subject "Test email" -Body "This is a test email" #email info


