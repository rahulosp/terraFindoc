#This Repo creates Keypair, Network, Subnet, Instances, Floating IP's, Security Grps, Volumes through TErraform on OSP Cloud.
#For running it any separate OSP Cloud the credentials should be updates in the file terraform.tfvars.json at the start.

# A private key id_rsa can be used to login into instances post creation, both RDP and ssh is allowed in the security groups.
# A new Admin user is injected through cloud-init, if the image supports it. This user has sudo privileges and can be used to access the instance post creation

The Std_node variable is an array to accomodate multiple types of instances.
The count variable within an object of std_node variable, determines how many instances of the same type will be created.

#To run this code without docker, you need to install terraform version 1.42 or above in your system. Then change the to suit your environment and run the below commands
#to get resources created.
terraform init
terraform plan
terraform apply

#To destroy the resources created run
terraform destroy

#To run this code via docker, here are the commands, you need to create a folder and mount it to the running docker container.
#To do terraform plan
docker run -it --rm -v /root/coryterra:/data broadinstitute/terraform plan

#To do terraform apply
docker run -it --rm -v /root/coryterra:/data broadinstitute/terraform apply

#To do terraform destroy, this will destroy all the resources
docker run -it --rm -v /root/coryterra:/data broadinstitute/terraform destroy


#To run the code successfully , copy over the code into a folder e.g. coryterra. Change the variables in terraform.tfvars.json to suit
#your environment needs. And run the three commands above in order.
