$N_Days_Back_to_Include = Read-Host "Which File of the Day: "
$SourceDir = "C:\CopyOperation\Sources"
$DestDir = "C:\CopyOperation\Destination"
$Year = Get-Date -Format "yyyy"
$Today = Get-Date -Format "MMdd"
if ($N_Days_Back_to_Include -eq 0){

    #$SourcePath = Get-ChildItem "$SourceDir" -Filter "$Today" -Directory -Recurse | %{$_.FullName}
    #$FileName = Get-ChildItem -Path "$SourcePath" -Name -Recurse | Select-String -Pattern "$Today"
    $FileName = Get-ChildItem -Path "$SourceDir\$Year\$Today" | where { $_.Name -match  "CRC_Opex_$($Year)$($Today)_54321.txt" }

    if (!(Test-Path -Path "$DestDir\$Year\$Today")){
        New-Item "$DestDir\$Year\$Today" -Type Directory
    }
    
    #Copy-Item -Path "$SourcePath\$FileName" -Destination "$DestDir\$Year\$Today\"
    If ($FileName)
    {
    Copy-Item -Path $($FileName.FullName) -Destination "$DestDir\$Year\$Today\"
    }
}

else{
    $BackDate = (Get-Date).AddDays("$N_Days_Back_to_Include").ToString("MMdd")
    
    #$SourcePath = Get-ChildItem "$SourceDir" -Filter "$BackDate" -Directory -Recurse | %{$_.FullName}
    #$FileName = Get-ChildItem -Path "$SourcePath" -Name -Recurse | Select-String -Pattern "$BackDate"
    $FileName = Get-ChildItem -Path "$SourceDir\$Year\$BackDate" | where { $_.Name -match  "CRC_Opex_$($Year)$($BackDate)_54321.txt" }

    if (!(Test-Path -Path "$DestDir\$Year\$BackDate")){
        New-Item "$DestDir\$Year\$BackDate" -Type Directory
    }
    
    #Copy-Item -Path "$SourcePath\$FileName" -Destination "$DestDir\$Year\$BackDate\"
    If ($FileName)
    {
    Copy-Item -Path $($FileName.FullName) -Destination "$DestDir\$Year\$BackDate\"
    }

}
