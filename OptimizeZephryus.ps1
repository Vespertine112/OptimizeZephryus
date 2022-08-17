#Requires -RunAsAdministrator 
param ($disable,$enable,$suspend,$start)

# Authors: hillbgh@gmail.com, 
# Please contribute if you have other fixes which can help optimize the g15.
# If not run as admin, it cannot kill/suspend/enable/disable services.

# NOTES: On the G15 AsusOptimization manages keyboard special controls (fn keys / macros etc). 
# 'asus' & 'asusm' control the asus update service

$servicesArray = @(
    # "ArmouryCrateControlInterface",
    # "ArmouryCrateService",
    "asus",
    "AsusAppService",
    "ASUSLinkNear",
    "ASUSLinkRemote",
    "asusm",
    # "ASUSOptimization", 
    "AsusROGLSLService",
    "ASUSSwitch",
    "ASUSSystemAnalysis",
    "ASUSSystemDiagnosis",
    "DoSvc",
    "GameSDK Service",
    "ROG Live Service",
    "WSearch",
    "AsusCertService",
    "ASUSSoftwareManager"
    )

for ($i = 0; $i -lt $servicesArray.count; $i++){
    $service = $servicesArray[$i]

    try{
        if ($disable){
            Set-Service -InputObject $service -StartupType Disabled
            $newStartMode= Get-Service -Name $service | select -property starttype
            Write-Host "New Status for " $service " : " $newStartMode.StartType
            continue
        }
        if ($enable){
            Set-Service -InputObject $service -StartupType Automatic
            $newStartMode= Get-Service -Name $service | select -property starttype
            Write-Host "New Status for " $service " : " $newStartMode.StartType
            continue  
        }
        if ($suspend){
            Set-Service -InputObject $service -Status paused
            Write-Host "Supsended: " $service
            continue
        }
        if ($start){
            Start-Service -InputObject $service 
            Write-Host "Started " $service
            continue
        }
        Stop-Service -Name $service -Force 
        Write-Host "Killed: " $service
    } catch {
        Write-Host "An error occured with: " $service
    }
}