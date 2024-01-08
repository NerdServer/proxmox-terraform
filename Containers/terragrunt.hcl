terraform {
  source = "github.com/NerdServer/proxmox-terraform-modules//lxc_ubuntu?ref=main"
}

locals {
  containers = {
    Dell-Management = {
      target_node    = "nerd-pve02"
      rootfs_storage = "pve-iscsi-lun0"
      rootfs_size    = "10G"
      ostemplate     = "ISO:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
      container_name = "Dell-Management"
    }
    # Add more containers if needed
  }
}

inputs = {
  lxc_containers = local.containers
}
#comment to trigger action