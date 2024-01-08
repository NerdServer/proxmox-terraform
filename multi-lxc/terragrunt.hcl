terraform {
  source = "github.com/NerdServer/proxmox-terraform-modules//lxc_ubuntu_multi?ref=main"
}

locals {
  containers = { for i in range(1, 1) : i => { #change range to adjust number of cts created.
    target_node    = "nerd-pve02"
    rootfs_storage = "pve-iscsi-lun0"
    rootfs_size    = "8G"
    tags           = "lxc"
    ostemplate     = "ISO:vztmpl/ubuntu-20.04-standard_20.04-1_amd64.tar.gz"

  } }
}

inputs = {
  lxc_containers = local.containers
}
###comment to trigger actions