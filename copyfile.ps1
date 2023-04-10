$N_Days_Back_to_Include = Read-Host "Which File of the Day: "
$SourceDir = "Sources"
$DestDir = "Destination"
$Year = Get-Date -Format "yyyy"
$Today = Get-Date -Format "MMdd"
if ($N_Days_Back_to_Include -eq 0){
    $SourcePath = Get-ChildItem "$SourceDir" -Filter "$Today" -Directory -Recurse | %{$_.FullName}
    $FileName = Get-ChildItem -Path "$SourcePath" -Name -Recurse | Select-String -Pattern "$Today"
    if (!(Test-Path -Path "$DestDir/$Year/$Today")){
        New-Item "$DestDir/$Year/$Today" -Type Directory
    }
    Copy-Item -Path "$SourcePath/$FileName" -Destination "$DestDir/$Year/$Today/"
}else{
    $BackDate = (Get-Date).AddDays("$N_Days_Back_to_Include").ToString("MMdd")
    $SourcePath = Get-ChildItem "$SourceDir" -Filter "$BackDate" -Directory -Recurse | %{$_.FullName}
    $FileName = Get-ChildItem -Path "$SourcePath" -Name -Recurse | Select-String -Pattern "$BackDate"
    if (!(Test-Path -Path "$DestDir/$Year/$BackDate")){
        New-Item "$DestDir/$Year/$BackDate" -Type Directory
    }
    Copy-Item -Path "$SourcePath/$FileName" -Destination "$DestDir/$Year/$BackDate/"
}