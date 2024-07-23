terraform {
  source = "github.com/NerdServer/proxmox-terraform-modules//Containers?ref=main"
}

locals {
  containers = {
    Dell-Management = {
      target_node    = "nerd-pve04"
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
    Ansible-Semaphore = {
      target_node    = "nerd-pve04"
      rootfs_storage = "pve-iscsi-lun0"
      rootfs_size    = "50G"
      gw             = "10.0.40.1"
      ip             = "10.0.40.29/24"
      tag            = "40"
      ostemplate     = "ISO:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
      cores          = "4"
      memory         = "8000"
      onboot         = true
      start          = true
    }
    Pterodactyl-Panel = {
      target_node    = "nerd-pve02"
      rootfs_storage = "pve-iscsi-lun0"
      rootfs_size    = "25G"
      gw             = "10.0.40.1"
      ip             = "10.0.40.50/24"
      tag            = "40"
      ostemplate     = "ISO:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
      cores          = "4"
      memory         = "8000"
      onboot         = true
      start          = true
    }
    Pterodactyl-Wing01 = {
      target_node    = "nerd-pve02"
      rootfs_storage = "pve-iscsi-lun0"
      rootfs_size    = "50G"
      gw             = "10.0.40.1"
      ip             = "10.0.40.51/24"
      tag            = "40"
      ostemplate     = "ISO:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
      cores          = "8"
      memory         = "16000"
      onboot         = true
      start          = true
    }
  }
}

inputs = {
  lxc_containers = local.containers
}
