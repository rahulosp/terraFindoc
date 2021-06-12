# Define required providers
terraform {
#  required_version = ">= 0.16.0"
    required_providers {
      openstack = {
        source  = "terraform-provider-openstack/openstack"
        version = "~> 1.40"
      }
    }
}

# Configure the OpenStack Provider
provider "openstack" {
    user_name = var.openstack_user_name
    tenant_name = var.openstack_tenant_name
    password = var.openstack_password
    auth_url = var.openstack_auth_url
    user_domain_name = var.openstack_domain
    region = var.openstack_region
}
