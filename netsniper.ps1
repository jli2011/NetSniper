getmac #prints out mac address and transport name of current system
arp -a #prints out all mac addresses
$macdata = arp -a #puts all mac addresses into variable
Add-Content Desktop\test.txt $macdata #appends all mac addresses to file
write-host $macdata[0] #prints out the first line of macdata
write-host $macdata[1] #prints out the first line of macdata
write-host $macdata[2] #prints out the first line of macdata
write-host $macdata[3] #prints out the first line of macdata
write-host $macdata[4] #prints out the first line of macdata
write-host $macdata[5] #prints out the first line of macdata
write-host $macdata[6] #prints out the first line of macdata

$ipInput = Read-Host -Prompt 'Please enter the IP Address you want to monitor (in 000.000.000.000 format)' #prompts user to input the ip address to monitor
$macInput = Read-Host -Prompt 'Please enter the MAC Address you want to monitor (in 00-00-00-00-00-00 format)' #prompts user to input the mac address to monitor
$typeInput = Read-Host -Prompt 'Please enter the type' #prompts user to input the type

$compareInput = '  ' $ipInput ''

write-host "You input the MAC address" $macInput #displays user input for user to double check

$i = 0
while ($i = 0)
{
    #compares the line with the macInput to each line in the macdata
    #if it reaches the end and can't find the line, then email admin and say device is offline
    #if found, email admin that device is online
}

#sends an email to specified address
$PSEmailServer = "careercenter.colo.hawaii.edu" #smtp server name
Send-MailMessage -From "jiajie@hawaii.edu" -To "jiajie@hawaii.edu" -Subject "Test email" -Body "This is a test email" #email info

128.171.112.1         70-ca-9b-78-8f-c3     dynamic


