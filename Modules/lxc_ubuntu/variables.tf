variable "lxc_containers" {
  type = map(object({
    target_node     = string
    ostemplate      = string
    ssh_public_keys = string
    rootfs_storage  = string
    rootfs_size     = string
  }))
}


