# Render a multi-part cloud-init config making use of the part
# above, and other source files
data "template_cloudinit_config" "config" {
  gzip          = true
  base64_encode = true

  # Main cloud-config configuration file.
  part {
    filename     = "init.cfg"
    content_type = "text/cloud-config"
    content      = templatefile("${path.module}/cloud-init.tpl", {
      admin_user = var.admin_user
      admin_pass = var.admin_pass
      ssh_public_key = var.ssh_public_key
    })
  }

  depends_on = [ openstack_compute_instance_v2.std_node_instance_1 ]
}
