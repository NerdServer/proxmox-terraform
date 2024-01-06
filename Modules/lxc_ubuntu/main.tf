terraform {
  required_providers {
    proxmox = {
      source  = "TheGameProfi/proxmox"
      version = "2.9.16"
      proxmox_api_url= "${var.proxmox_api_url}"
      proxmox_proxmox_api_token_id= "${var.proxmox_api_token_id:}"
      proxmox_api_token_secret= "${var.proxmox_api_token_secret}"

    }
  }
}
