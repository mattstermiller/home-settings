function k8s-nphi-dev { az account set --subscription d5bb4703-0f15-481f-ab1c-9e5672c63b1f; az aks get-credentials --resource-group USC-RD-Canopy-RG --name aks-canopy-dev }
function k8s-dev { az account set --subscription ab875ab8-87c3-4db5-b508-61706a0467dc; az aks get-credentials --resource-group aks-canopy-dev --name aks-pri-canopy-dev }
function k8s-uat { az account set --subscription bf6ec698-9ef6-48fc-9f84-38a618677f6d; az aks get-credentials --resource-group aks-canopy-uat --name aks-pri-canopy-uat }
function k8s-prod { az account set --subscription 71745393-240e-4551-8a05-8a66edddbfe7; az aks get-credentials --resource-group aks-canopy-prod --name aks-pri-canopy-prod }

function k9s-nphi-dev { k9s --context aks-canopy-dev }
function k9s-dev { k9s --context aks-pri-canopy-dev }
function k9s-uat { k9s --context aks-pri-canopy-uat }
function k9s-prod { k9s --context aks-pri-canopy-prod }

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
