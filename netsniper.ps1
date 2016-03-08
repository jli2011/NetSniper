getmac #prints out mac address and transport name of current system
arp -a #prints out all mac addresses
$macArray = arp -a #puts all mac addresses into array
write-host " "
write-host "The size of macArray is" $macArray.Length #prints out the length of macdata

Clear-Content Desktop\test.txt #erase contents of a file
Add-Content Desktop\test.txt $macArray #appends all mac addresses to file

$ErrorActionPreference = "Stop"

#gets ip address from mac address
$macInput = Read-Host -Prompt 'Please enter the MAC Address you want to monitor (in 00-00-00-00-00-00 format)' #prompts user to input the mac address to monitor
write-host " "
write-host "You input the MAC address" $macInput #displays user input for user to double check

$i = 1

while($i = 1)
{
    $ipAddress = arp -a | select-string $macInput |% { $_.ToString().Trim().Split(" ")[0] } #gets the ip address from the MAC
    
    if ([string]::IsNullOrEmpty($ipAddress))
        {
            write-host "IP address not found"
            write-host "Online status = False"
            $wshell = New-Object -ComObject Wscript.Shell
            $wshell.Popup("Device not found!",0,"Error Message")
            Exit
        }
    else
        {
        $status = Test-Connection $ipAddress -count 4 -quiet -ErrorAction Stop
        
        if ($status = "True")
            {
                write-host "The ip address of this MAC address is" $ipAddress #prints the IP address from MAC address input
            }
        else 
            {
                write-host "That MAC address is not online"
                $1 = 0
            }
        }
    
    write-host "Online status =" $status
    
    #ping $ipAddress >> Desktop\ping.txt $pingData #continuous ping
    
    $status = Test-Connection $ipAddress -count 4 -quiet -ErrorAction Stop

        if ($status = "True") #pings the ip address 4 times
            {
                write-host "Device Online." #if ping successful
                $macArray = arp -a
            }
        else
            {
                write-host "Device Offline." #if ping failed
                $macArray = arp -a
            }
}

#sends an email to specified address
#Send-MailMessage -From "jiajie@hawaii.edu" -To "jiajie@hawaii.edu" -Subject "Test email" -Body "This is a test email" -SmtpServer "smtp.gmail.com" #email info


