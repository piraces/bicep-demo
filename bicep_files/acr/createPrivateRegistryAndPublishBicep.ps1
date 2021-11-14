$LoginServer = az deployment group create --resource-group arm-templates-demo-rpiraces --template-file main.bicep --query properties.outputs.loginServer.value
Write-Output "Login server for ACR is: $LoginServer"
az bicep publish --file ../shared/blob_container.bicep --target br:$LoginServer/bicep/modules/storage:v1