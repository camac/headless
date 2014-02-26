$build_number = "%build.number%"
$checkout_location = "%system.teamcity.build.checkoutDir%"
 
Clear-Content HEADLESS0.log
 
$args = '-RPARAMS -vmargs -Dcom.ibm.designer.cmd="true,true,Headless4.nsf,importandbuild,V:\DominoGit\Headless\com.gregorbyte.headless.nsf\.project,Headless4.nsf"'
 
Write-Host $args
 
$p = Start-Process designer -ArgumentList $args
$target = 'notes2'
$process = Get-Process | Where-Object {$_.ProcessName -eq $target}
 
do {
Get-Content headless0.log -Wait | Select-String "closing designer" | %{ write-host Found $_; break}
} while(!$process.HasExited)