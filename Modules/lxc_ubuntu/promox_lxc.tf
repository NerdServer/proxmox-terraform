resource "proxmox_lxc" "lxc_containers" {
  for_each        = var.lxc_containers

  target_node     = each.value.target_node
  hostname        = local.container_names[tostring(each.key)]
  ostemplate      = "ISO:vztmpl/ubuntu-20.04-standard_20.04-1_amd64.tar.gz"
  ssh_public_keys = var.ssh_pub_key

  rootfs {
    storage = each.value.rootfs_storage
    size    = each.value.rootfs_size
  }

  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "dhcp"
    ip6    = "dhcp"
  }

  unprivileged = false
}
