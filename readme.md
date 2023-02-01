This module deploys **SonarQube server** with embedded H2 database to ACI and generates user token.  
How to use:
1. Initiate Terraform: 
	* run ```terraform init``` command
2. Deloy server:   
	* run ```terraform plan -target="module.SonarServer" -out="server.out"```
	* run ```terraform apply -target="module.SonarServer" server.out -auto-approve```
3. Generate token:
	* run ```terraform plan -target="module.SonarToken" -out="token.out"```
	* run ```terraform apply -target="module.SonarToken" token.out -auto-approve```
4. Destroy resources:
	* run ```terraform destroy -auto-approve```