#This Repo creates Keypair, Network, Subnet, Instances, Floating IP's, Security Grps, Volumes through TErraform on OSP Cloud.
#For running it any separate OSP Cloud the credentials should be updates in the file terraform.tfvars.json at the start.

The Std_node variable is an array to accomodate multiple types of instances.
The count variable within an object of std_node variable, determines how many instances of the same type will be created.

#To run this code via docker, here are the commands, you need to create a folder and mount it to the running docker container.
#To do terraform plan
docker run -it --rm -v /root/coryterra:/data broadinstitute/terraform plan

#To do terraform apply
docker run -it --rm -v /root/coryterra:/data broadinstitute/terraform apply

To do terraform destroy
docker run -it --rm -v /root/coryterra:/data broadinstitute/terraform destroy


#To run the code successfully , copy over the code into a folder e.g. coryterra. Change the variables in terraform.tfvars.json to suit
#your environment needs. And run the three commands above in order.
