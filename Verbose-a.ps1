#start https://www.petri.com/doing-more-with-powershell-verbose-messages
$VerbosePreference = "continue"
$VerbosePreference = "silentlycontinue"
Write-Verbose "I am doing something"
Write-Verbose "[$(Get-Date)] Starting to do something long running"
Write-Verbose "$((get-date).TimeOfDay.ToString()) Initializing array"
Function Get-Foo {
[cmdletbinding()]
Param(
[Parameter(Position = 0, Mandatory, ValueFromPipeline)]
[string[]]$Computername
)
 
Begin {
    Write-Verbose "[BEGIN  ] Starting: $($MyInvocation.Mycommand)"  
    Write-Verbose "[BEGIN  ] Initializing foo array"  
    $foo=@()
} #begin
 
Process {
    foreach ($computer in $computername) {
        Write-Verbose "[PROCESS] Getting foo from $($computer.toUpper())"
        #code happens
    }
 
} #process
 
 
End {
    Write-Verbose "[END    ] Ending: $($MyInvocation.Mycommand)"
} #end
 
}
Function TryMe {
[cmdletbinding()]
Param(
[string]$Computername
)
 
Begin {
    Write-Verbose "$((get-date).TimeOfDay.ToString()) [BEGIN  ] Starting: $($MyInvocation.Mycommand)"  
    Write-Verbose "$((get-date).TimeOfDay.ToString()) [BEGIN  ] Initializing array"
    $a = @()
 
} #begin
 
Process {
    Write-Verbose "$((get-date).TimeOfDay.ToString()) [PROCESS] Processing $Computername"
    # code goes here
} #process
 
End {
    Write-Verbose "$((get-date).TimeOfDay.ToString()) [END    ] Ending: $($MyInvocation.Mycommand)"
 
} #end
 
} #function

Function TryMe2 {
[cmdletbinding()]
Param(
[Parameter(Position = 0, Mandatory,ValueFromPipeline)]
[string]$Computername
)
 
Begin {
    $start = Get-Date
    Write-Verbose "00:00:00.0000000 [BEGIN  ] Starting: $($MyInvocation.Mycommand)"  
    Write-Verbose "$((New-TimeSpan -Start $start ).ToString()) [BEGIN  ] Initializing array"
    $a = @()
 
} #begin
 
Process {
    Write-Verbose "$((New-TimeSpan -Start $start).ToString()) [PROCESS] Processing $Computername"
    # code goes here
    Start-Sleep -Milliseconds 1234
} #process
 
End {
    Write-Verbose "$((New-TimeSpan -Start $start).ToString()) [END    ] Ending: $($MyInvocation.Mycommand)"
 
} #end
 
} #function
$pcname = HOSTNAME.EXE
get-foo $pcname -Verbose
TryMe $pcname -Verbose
TryMe2 $pcname -Verbose