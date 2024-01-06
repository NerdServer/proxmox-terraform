variable "lxc_containers" {
  type = map(object({
    target_node     = string
    ostemplate      = string
    ssh_public_keys = string
    rootfs_storage  = string
    rootfs_size     = string
  }))
}

variable "pm_api_url" {
  description = "Proxmox API URL"
  default     = null
}

variable "pm_api_token_secret" {
  default     = null
}

variable "pm_api_token_id" {
  default     = null
}
