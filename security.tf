resource "openstack_networking_secgroup_v2" "common" {
  name        = "common"
  description = "general purpose security group"
}

resource "openstack_networking_secgroup_rule_v2" "common_rule_v4_1" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.common.id
}

resource "openstack_networking_secgroup_rule_v2" "common_rule_v4_2" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "icmp"
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.common.id
}

resource "openstack_networking_secgroup_v2" "rdp" {
  name        = "rdp"
  description = "rdp security group"
}

resource "openstack_networking_secgroup_rule_v2" "rdp_rule_v4_1" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 3389
  port_range_max    = 3389
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.rdp.id
}

resource "openstack_networking_secgroup_rule_v2" "rdp_rule_v4_2" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "udp"
  port_range_min    = 3389
  port_range_max    = 3389
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.rdp.id
}
