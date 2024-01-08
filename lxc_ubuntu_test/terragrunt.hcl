terraform {
  source = "github.com/NerdServer/proxmox-terraform-modules//lxc_ubuntu?ref=main"
}

locals {
  containers = {
    container1 = {
      target_node    = "nerd-pve02"
      rootfs_storage = "pve-iscsi-lun0"
      rootfs_size    = "8G"
      tags           = "lxc"
      ostemplate     = "ISO:vztmpl/ubuntu-20.04-standard_20.04-1_amd64.tar.gz"
      container_name = "container-1"
      network_name   = "eth0"
      network_bridge = "vmbr0"
      network_ip     = "dhcp"
      network_ip6    = "dhcp"
      network_gateway = "10.0.40.1"
      network_subnet  = "10.0.40.0/24"
    }
  }
}

inputs = {
  lxc_containers = local.containers
}