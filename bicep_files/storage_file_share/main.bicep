@description('Specifies the name of the Azure Storage account.')
param storageAccountName string

@description('Specifies the name of the blob container.')
param containerName string = 'logs'

@description('Specifies the name of the File Share. File share names must be between 3 and 63 characters in length and use numbers, lower-case letters and dash (-) only.')
@minLength(3)
@maxLength(63)
param fileShareName string

@description('Specifies the location in which the Azure Storage resources should be deployed.')
param location string = resourceGroup().location


var containerName2 = '${containerName}2'
var containerName3 = '${containerName}3'
var containerName4 = '${containerName}4'

resource sa 'Microsoft.Storage/storageAccounts@2021-04-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}

// Create a container using a local bicep module
module blobContainerModule '../shared/blob_container.bicep' = {
  name: 'blobContainerDeploy'
  params: {
    containerName: containerName
    storageAccountName: storageAccountName
  }
  dependsOn: [
    sa
  ]
}

// Create a container using a bicep module published in a private registry
module blobContainerRemoteModule1 'br:acrqnuaqlsdeiczk.azurecr.io/bicep/modules/storage:v1' = {
  name: 'blobContainerRemoteDeploy1'
  params: {
    containerName: containerName2
    storageAccountName: storageAccountName
  }
  dependsOn: [
    sa
  ]
}

// Create a container using a bicep module published in a private registry (with alias)
module blobContainerRemoteModule2 'br/DemoModules:storage:v1' = {
  name: 'blobContainerRemoteDeploy2'
  params: {
    containerName: containerName3
    storageAccountName: storageAccountName
  }
  dependsOn: [
    sa
  ]
}

// Create a container using a template spec with alias
module blobContainerRemoteModule3 'ts/DemoSpecs:BlobContainer:v1' = {
  name: 'blobContainerRemoteDeploy3'
  params: {
    containerName: containerName4
    storageAccountName: storageAccountName
  }
  dependsOn: [
    sa
  ]
}

resource fileShare 'Microsoft.Storage/storageAccounts/fileServices/shares@2021-04-01' = {
  name: '${sa.name}/default/${fileShareName}'
}

output blobContainer1 string = blobContainerModule.name
output blobContainer2 string = blobContainerRemoteModule1.name
output blobContainer3 string = blobContainerRemoteModule2.name
output blobContainer4 string = blobContainerRemoteModule3.name
