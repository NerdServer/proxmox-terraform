terraform {
  module "lxc_ubuntu" {
  source = "github.com/NerdServer/proxmox-terraform-modules//lxc_ubuntu"
  }
}
}

locals {
  containers = { for i in range(1, 3) : i => {
    target_node    = "nerd-pve02"
    rootfs_storage = "pve-iscsi-lun0"
    rootfs_size    = "8G"
    tags           = "lxc"
    ostemplate     = "local:vztmpl/ubuntu-20.04-standard_20.04-1_amd64.tar.gz"

  } }
}

inputs = {
  lxc_containers = local.containers
}