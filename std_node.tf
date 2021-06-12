locals {
    std_node_local = flatten([
        for node in var.std_node : [
            for i in range(node.count) : {
                flavor = node.flavor
                image = node.image
                os = node.os
                fip = node.fip
                name = "${node.basename}-${i + 1}"
            }
        ]
    ])
}

resource "openstack_compute_instance_v2" "std_node_instance_1" {
  for_each = {
    for node in local.std_node_local : node.name => node
  }

  name        = each.value.name
  image_name  = each.value.image
  flavor_name = each.value.flavor
  key_pair    = "${var.openstack_user_name}_keypair"
  security_groups = [
      openstack_networking_secgroup_v2.common.name,
      openstack_networking_secgroup_v2.rdp.name,
  ]

  network {
    uuid = openstack_networking_network_v2.network_1.id
  }

  depends_on = [ openstack_networking_subnet_v2.subnet_1 ]
}

data "openstack_images_image_v2" "std_node_image_instance_1" {
    for_each = {
        for node in local.std_node_local : node.name => node
    }
    name = each.value.image
    #name = "cirros-0.4.0-x86_64-disk"
}

data "openstack_compute_flavor_v2" "std_node_compute_flavor_instance_1" {
    for_each = {
        for node in local.std_node_local : node.name => node
    }
    name = each.value.flavor
}


resource "openstack_networking_floatingip_v2" "std_node_instance_fip_1" {
    for_each = {
        for node in local.std_node_local : node.name => node
        if node.fip
    }
    pool = var.public_network
}

resource "openstack_compute_floatingip_associate_v2" "std_node_instance_fip_1" {
    for_each = {
        for node in local.std_node_local : node.name => node
        if node.fip
    }
    floating_ip = openstack_networking_floatingip_v2.std_node_instance_fip_1[each.key].address
    instance_id = openstack_compute_instance_v2.std_node_instance_1[each.key].id
    depends_on = [
        openstack_compute_instance_v2.std_node_instance_1,
        openstack_networking_floatingip_v2.std_node_instance_fip_1,
        openstack_networking_router_v2.router_1,
    ]
}

resource "openstack_blockstorage_volume_v3" "std_node_instance_1_vol_1" {
    for_each = {
        for node in local.std_node_local : node.name => node
    }
    name     = "${var.openstack_tenant_name}-${each.value.name}-vol"
    size     = data.openstack_compute_flavor_v2.std_node_compute_flavor_instance_1[each.key].disk
    image_id = data.openstack_images_image_v2.std_node_image_instance_1[each.key].id
}
