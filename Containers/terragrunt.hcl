terraform {
  source = "github.com/NerdServer/proxmox-terraform-modules//Containers?ref=main"
}

locals {
  containers = {
    Dell-Management = {
      target_node    = "nerd-pve02"
      rootfs_storage = "pve-iscsi-lun0"
      rootfs_size    = "10G"
      gw             = "10.0.40.1"
      ip             = "10.0.40.27/24"
      tag            = "40"
      ostemplate     = "ISO:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
      cores          = "1"
      memory         = "512"
      onboot         = true
      start          = true
    }
    Dockerge = {
      target_node    = "nerd-pve02"
      rootfs_storage = "pve-iscsi-lun0"
      rootfs_size    = "50G"
      gw             = "10.0.40.1"
      ip             = "10.0.40.28/24"
      tag            = "40"
      ostemplate     = "ISO:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
      cores          = "20"
      memory         = "16000"
      onboot         = true
      start          = true
    }
  }
}

inputs = {
  lxc_containers = local.containers
}
