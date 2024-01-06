variable "lxc_containers" {
  type = map(object({
    target_node     = string
    rootfs_storage  = string
    rootfs_size     = string
  }))
}

variable "pm_api_url" {
  description = "Proxmox API URL"
    type        = string
    default     = null
}

variable "pm_api_token_secret" {
    type        = string
    default     = null
}

variable "pm_api_token_id" {
    type        = string
    default     = null
}

variable "proxmox_api_url" {
  description = "Proxmox API URL"
    type        = string
    default     = null
}

variable "proxmox_api_token_id" {
    type        = string
    default     = null
}

variable "proxmox_api_token_secret" {
    type        = string
    default     = null
}

variable "ssh_public_keys" {
    type        = string
    default     = null
}

variable "repo" {
    type        = string
    default     = null
}
variable "pat" {
    type        = string
    default     = null
}