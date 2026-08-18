- In the terminal go to inside FormulaOne folder
- Run the command: docker-compose up
- In other terminal go to inside FormulaOne.DataService folder
- Run the command: dotnet ef database update --startup-project ../FormulaOne.Api

# Create a Service Principal (with Powershell) in Azure to connect to Azure from Github

az ad sp create-for-rbac `
  --name github-terraform-deployer-formula-one `
  --role Contributor `
  --scopes /subscriptions/ed0eed35-e487-434c-8eed-1f15d8b0909f/resourceGroups/formula-one-system-dev-rg `
  --json-auth `
  --output json

- Create a repository secret in Github with the name "AZURE_CREDENTIALS" and the value is the output of the previous command

# If 'terraform destroy' was executed then these needs to be updated in Github:

- vars.ACR_SERVER
- secrets.ACR_USERNAME
- secrets.ACR_PASSWORD

# If 'terraform destroy' was executed then these needs to be created: Create a Service Principal (with Powershell) in Azure to connect to Azure from Github

az ad sp create-for-rbac `
  --name github-terraform-deployer-formula-one `
  --role Contributor `
  --scopes /subscriptions/ed0eed35-e487-434c-8eed-1f15d8b0909f/resourceGroups/formula-one-system-dev-rg `
  --json-auth `
  --output json

  # Database Connection String format:

  Data Source=formula-one-system-dev-sqlserver.database.windows.net;Initial Catalog=formula-one-system-dev-Formulaone;User ID={your_user};Password={your_password};Encrypt=True;TrustServerCertificate=True;

  # TODO:

  - Migrate to Terraform State to be store in Azure
  - Add create-for-rbac to be created in the pipeline
  - Create workflow for Infra. "deploy-infra.yml"