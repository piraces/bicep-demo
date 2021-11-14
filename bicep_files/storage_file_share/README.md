# Deploy using Azure CLI

```bash
az deployment group create --resource-group arm-templates-demo-rpiraces --template-file .\main.bicep --parameters main.parameters.json
```

# Compile Bicep to JSON file

```bash
bicep build --file main.bicep
```

Or

```bash
az bicep build --file main.bicep
```
