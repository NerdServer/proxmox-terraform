terraform {
  source = "../Modules/lxc_ubuntu"
}

locals {
  containers = { for i in range(1, 2) : i => {
    target_node    = "nerd-pve02"
    rootfs_storage = "pve-iscsi-lun0"
    rootfs_size    = "8G"
    tags           = "lxc"

  } }
}

inputs = {
  lxc_containers = local.containers
}