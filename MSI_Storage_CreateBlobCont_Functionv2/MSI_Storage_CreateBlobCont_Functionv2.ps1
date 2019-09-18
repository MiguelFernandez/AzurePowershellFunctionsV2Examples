using namespace System.Net

# Input bindings are passed in via param block.
param($Request, $TriggerMetadata)

Write-Host "PowerShell HTTP trigger function processed a request."

$apiVersion = "2017-09-01"
$resourceURI = "https://storage.azure.com"
$tokenAuthURI = $env:MSI_ENDPOINT + "?resource=$resourceURI&api-version=$apiVersion"
$tokenResponse = Invoke-RestMethod -Method Get -Headers @{"Secret"="$env:MSI_SECRET"} -Uri $tokenAuthURI
$accessToken = $tokenResponse.access_token


$headers = @{    
     "Authorization"= "Bearer $accessToken"     
     "x-ms-version"="2017-11-09"

 }
#example https://{storagename}.blob.core.windows.net/{new container name}?restype=container
$uriBlobContainer = "https://mifernafunc.blob.core.windows.net/newcont?restype=container"
try{
$status = (Invoke-WebRequest -Uri $uriBlobContainer -Headers $headers -Method Put).statuscode
}
catch {
    $status = $_.Exception.Response.StatusCode.value__
}

switch ($status) {
        201 { 
            $body = "Container created successfully"
            
        }
        409 { 
            $body = "The specified container already exists"
            
        }
        
        default { 
            $body = "Status code $status"
            
        }
}

Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
    StatusCode = $status
    Body = $body
})
