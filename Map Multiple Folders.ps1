$msg = 'Do you want to map a drive to this PC? Y/N'
do {
    $response = Read-host -prompt $msg
    #If y is pressed it will continue through the loop. If you choose n the script will end. 
    if ($response -eq 'y') {
        #Mapping the drive to whatever letter you choose 
        $DriveLetter = Read-host "What drive letter are you mapping to?"
        #Mapping the drive you choose
        $FileLocation = Read-host "What is the shared folder location?"
        #Mapping the drive based off the $DriveLetter & $FileLocation inputs
        New-psDrive -Name "$DriveLetter" -PSProvider FileSystem -Root "$FileLocation" -Persist

    }
} until ($response -eq 'n')
Write-host "Summary"
Write-host "The below drives are now mapped to the PC:"
#net use is to show you all the drives that are mapped to the PC
net use
read-host "Press CTRL + C to quit"