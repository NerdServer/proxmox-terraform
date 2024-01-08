terraform {
  source = "github.com/NerdServer/proxmox-terraform-modules//lxc_ubuntu?ref=main"
}

locals {
  containers = {
    container1 = {
      target_node    = "nerd-pve02"
      rootfs_storage = "pve-iscsi-lun0"
      rootfs_size    = "8G"
      ostemplate     = "ISO:vztmpl/ubuntu-20.04-standard_20.04-1_amd64.tar.gz"
      container_name = "container-1"
    }
    # Add more containers if needed
  }
}

inputs = {
  lxc_containers = local.containers
}
