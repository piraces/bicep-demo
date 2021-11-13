# Deploy using Azure CLI

```bash
az deployment group create --resource-group arm-templates-demo-rpiraces --template-file .\azuredeploy.json
```

# Decompile JSON to Bicep file

```bash
bicep decompile --file azuredeploy.json
```

Or

```bash
az bicep decompile --file azuredeploy.json
```
