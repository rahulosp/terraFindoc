#cloud-config
users:
  - name: ${admin_user}
    lock-passwd: false
    passwd: ${admin_pass}
    sudo: ALL=(ALL) NOPASSWD:ALL
    ssh_authorized_keys:
      - ${ssh_public_key}
