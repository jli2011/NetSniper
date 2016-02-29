Import-Csv 'ipCSV.csv' |

getmac #prints out mac address and transport name of current system
arp -a #prints out all mac addresses
$macdata = arp -a #puts all mac addresses into variable
Clear-Content Desktop\test.txt #erase contents of a file
Add-Content Desktop\test.txt $macdata #appends all mac addresses to file

#gets ip address from mac address
$macInput = Read-Host -Prompt 'Please enter the MAC Address you want to monitor (in 00-00-00-00-00-00 format)' #prompts user to input the mac address to monitor
write-host " "
write-host "You input the MAC address" $macInput #displays user input for user to double check
$ipAddress = arp -a | select-string $macInput |% { $_.ToString().Trim().Split(" ")[0] } #gets the ip address from the MAC
write-host "The ip address of this MAC address is" $ipAddress #prints the IP address from MAC address input

#ping $ipAddress >> Desktop\ping.txt $pingData #continuous ping

if(Test-Connection $ipAddress -count 4 -quiet) #pings the ip address 4 times
    {
        write-host "Device Online." #if ping successful
    }
else
    {
        write-host "Device Offline." #if ping failed
    }

#sends an email to specified address
Send-MailMessage -From "jiajie@hawaii.edu" -To "jiajie@hawaii.edu" -Subject "Test email" -Body "This is a test email" -SmtpServer "smtp.gmail.com" #email info


