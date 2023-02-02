This module deploys **Remote backend for TF**  
How to use:
1. Initiate Terraform: 
	* run ```terraform init``` command
2. Deloy storage account:   
	* run ```terraform plan -target="module.RemoteState""```
	* run ```terraform apply -target="module.remoteState" -auto-approve```
3. As a result of the previous step, you'll get the txt file backend-config.txt in the directory where module is located.
4. In order to start using remote backend:
	* run ```terraform init -backend-config="./modules/remote_state/backend-config.txt"```
