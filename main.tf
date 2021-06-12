resource "openstack_networking_network_v2" "network_1" {
  name           = var.tenant_network
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "subnet_1" {
  name       = "subnet_1"
  network_id = openstack_networking_network_v2.network_1.id
  cidr       = var.cidr
  ip_version = 4
  enable_dhcp = true
  allocation_pool {
    start = var.dhcp_start
    end = var.dhcp_end
  }
}

# the keypair namespace is global across all projects.
resource "openstack_compute_keypair_v2" "keypair_1" {
  name       = "${var.openstack_user_name}_keypair"
  public_key = var.ssh_public_key
}

data "openstack_networking_network_v2" "ext_network" {
  name = var.public_network
}

data "openstack_networking_subnet_ids_v2" "ext_subnets" {
  name       = var.public_network
  network_id = data.openstack_networking_network_v2.ext_network.id
}

resource "openstack_networking_router_v2" "router_1" {
  name = var.router_name
  admin_state_up      = true
  external_network_id = data.openstack_networking_network_v2.ext_network.id
}

resource "openstack_networking_router_interface_v2" "router_1_interface_1" {
  router_id = openstack_networking_router_v2.router_1.id
  subnet_id = openstack_networking_subnet_v2.subnet_1.id
}
