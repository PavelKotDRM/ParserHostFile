$location_file = "$env:SystemDrive\Windows\System32\Drivers\etc\hosts"# # Path to file hosts "$env:SystemDrive\Windows\System32\Drivers\etc\hosts"
$Pattern = [Regex]'^\s*(?<Address>[0-9.:]+)\s+(?<Host>[\w.-]+)' # Regex to match adress and host

$Heading = @("# Copyright (c) 1993-2009 Microsoft Corp.",
"#",
"# This is a sample HOSTS file used by Microsoft TCP/IP for Windows.",
"#",
"# This file contains the mappings of IP addresses to host names. Each",
"# entry should be kept on an individual line. The IP address should",
"# be placed in the first column followed by the corresponding host name.",
"# The IP address and the host name should be separated by at least one",
"# space.",
"#",
"# Additionally, comments (such as these) may be inserted on individual",
"# lines or following the machine name denoted by a '#' symbol.",
"#",
"# For example:",
"#",
"#      102.54.94.97     rhino.acme.com          # source server",
"#       38.25.63.10     x.acme.com              # x client host",
"",
"# localhost name resolution is handled within DNS itself.",
"#	127.0.0.1       localhost",
"#	::1             localhost")


$Pattern�omments = [Regex]'(?<comment>^#+.+$)|(?<commentNull>#$)' # Regex to match comments
#$Pattern = [Regex]'^\s*(?<Address>[0-9.:]+)\s+(?<Host>[\w.-]+)|(?<comment>#+.+$)|(?<commentNull>#$)' # Regex to match adress, host and comments
#$PatternAdress = [Regex]'(?<Address>\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})|(?<Address>::\d{0,3})' # Regex to match adress
#$PatternHosts = [Regex]'(?(?<=(^\s*(?<Address>[0-9.:]+\s+)))(?<Host>[\w.-]+)|&)' # Regex to match host

$file = Get-Content $location_file
$lenth = $file.Length
if ($lenth -eq 21){
    if($file[0] -eq $Heading[0] -or $file[20] -ne $Heading[20]){
        "���� host ������ � �������� ������ ���������"
    }
    else{
        Write-Host "���� ������������� �������. ������ �:" -ForegroundColor red -BackgroundColor Black
        foreach ($i in 0..($lenth-1)) {
            $boolEq = $file[$i] -eq $Heading[$i]
            Write-Host  ("{0}: {1}" -f $boolEq, $file[$i])  -ForegroundColor red -BackgroundColor Black
            if ($boolEq -eq $false){
                Break
            }
        }
    }
}
elseif($lenth -lt 21){
    foreach ($i in 0..($lenth-1)) {
        $boolEq = $file[$i] -eq $Heading[$i]
        Write-Host  ("{0}: {1}" -f $boolEq, $file[$i])  -ForegroundColor red -BackgroundColor Black
            if ($boolEq -eq $false){
                Break
            }
    }
}
else{
    if($file[0] -ne $Heading[0] -or $file[20] -ne $Heading[20]){
        Write-Host "���� ������������� �������" -ForegroundColor red -BackgroundColor Black
        foreach ($i in 0..($lenth-1)) {
            $boolEq = $file[$i] -eq $Heading[$i]
            Write-Host  ("{0}: {1}" -f $boolEq, $file[$i])  -ForegroundColor red -BackgroundColor Black
            if ($boolEq -eq $false){
                Break
            }
        }
    }
    else{
        [Array]$ErrorArray = @()
        foreach ($i in 21..($lenth-1)){
            if ($file[$i] -match $Pattern){
                Write-Host ("{0}: {1}" -f $i, "OK") -ForegroundColor green -BackgroundColor Black
            }
            else{
                if ($file[$i] -match $Pattern�omments){
                    Write-Host ("{0}: ({1}) {2}" -f $i, "�����������", $file[$i]) -ForegroundColor yellow -BackgroundColor Black
                }
                else{
                    Write-Host ("{0}: {1}" -f $i, $file[$i]) -ForegroundColor red -BackgroundColor Black
                    $ErrorArray += $i
                }
            }
        }
        if ($ErrorArray.Length -eq 0){
            Write-Host "��� ������ � ����� ������������� �����" -ForegroundColor green -BackgroundColor Black
        }
        else{
            Write-Host "� ����� ���� ������ ������������� �������� � �������� : " -ForegroundColor red -BackgroundColor Black
            Write-Host  $ErrorArray -Separator ", "  -ForegroundColor red -BackgroundColor Black
        }
    }
}
