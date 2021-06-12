variable "openstack_user_name" {
        description = "The username for the Tenant."
        default = ""
}

variable "openstack_tenant_name" {
        description = "The name of the Tenant."
        default = ""
}

variable "openstack_password" {
        description = "The password for the Tenant."
        default = ""
}

variable "openstack_auth_url" {
        description = "The endpoint url to connect to OpenStack."
        default = ""
}

variable "openstack_region" {
        description = "The Region to be used for OpenStack."
        default = ""
}

variable "openstack_domain" {
    description = "The Domain to be used."
    default = ""
    type = string
}

variable "tenant_network" {
    description = "The network to be used."
    type = string
    default = ""
}

variable "public_network" {
    description = "The network to be used."
    type = string
    default = ""
}

variable "instance_image" {
    description = "The image to be used for VM creation."
    type = string
    default = ""
}

variable "instance_count" {
    description = "Number of instances to create."
    type = string
    default = "1"
}

variable "std_node" {
    type = list(object({
        flavor = string
        image = string
        os = string
        basename = string
        count = number
        fip = bool
    }))
    description = "standard node with floating ips"
}

variable "admin_user" {
    type = string
    default = "Admin"
    description = "admin user to be created and injected"
}


variable "admin_pass" {
    type = string
    default = "test_pass34a"
    description = "admin password to be injected"
}

variable "cidr" {
    type = string
    description = "Subnet CIDR to be created"
}

variable "dhcp_start" {
    type = string
    description = "Start IP of subnet CIDR, should fall within the subnet"
}

# must be in the  cidr subnet
variable "dhcp_end" {
    type = string
    description = "End IP of subnet CIDR, should fall within the subnet"
}

variable "router_name" {
    type = string
    description = "Name of the Router to be created"
}

variable "ssh_public_key" {
    type = string
    description = "Public key to use for Keypair creation"
}
