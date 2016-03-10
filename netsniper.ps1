#Remove front hash tag to enable the following features:
#getmac #prints out mac address and transport name of current system
#arp -a #prints out all mac addresses
#Clear-Content Desktop\test.txt #erase contents of a file
#Add-Content Desktop\test.txt $macArray #appends all mac addresses to file

#gets ip address from mac address
$macInput = Read-Host -Prompt 'Please enter the MAC Address you want to monitor (in 00-00-00-00-00-00 format)' #prompts user to input the mac address to monitor
write-host " "
write-host "You input the MAC address" $macInput #displays user input for user to double check

$i = 1
$checkNumber = 1

while($i = 1)
{
    $buttonNumber = 0
    $macArray = arp -a #puts all mac addresses into array
    write-host " "
    write-host "There are" $macArray.Length "ARP entries" #prints out the length of macdata
    $ipAddress = arp -a | select-string $macInput |% { $_.ToString().Trim().Split(" ")[0] } #gets the ip address from the MAC
    
    if ([string]::IsNullOrEmpty($ipAddress))#if MAC address is not found
        {
            write-host "IP address not found"
            
            #displays error message box
            $wshell = New-Object -ComObject Wscript.Shell
            $buttonNumber = $wshell.Popup("Device offline!",0,"Device Status")
            write-host "Device is offline"
            
            Exit #terminates code 
        }
    else #if MAC address is found
        {
        $status = Test-Connection $ipAddress -count 4 -quiet #ping the ip address 4 times while suppressing all errors
        
        if ($status = "True") #if connection returns true
            {
                write-host "The ip address of this MAC address is" $ipAddress #prints the IP address from MAC address input
                write-host "Connection check number = 4 x" $checkNumber #each connection check is equal to 4 pings
                $checkNumber = $checkNumber + 1
                write-host "Device Online." #if ping successful
                write-host " "
            }
        }
}


