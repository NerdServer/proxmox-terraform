terraform {
  required_providers {
    proxmox = {
      source  = "TheGameProfi/proxmox"
      version = "2.9.16"
      

    }
  }
}

provider "proxmox" {

 pm_api_url = "${var.proxmox_api_url}"
 pm_api_token_id = "${var.proxmox_api_token_id}"
 pm_api_token_secret = "${var.proxmox_api_token_secret}"

# (Optional) Skip TLS Verification
 pm_tls_insecure = true
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
