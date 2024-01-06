# Proxmox Provider
# ---
# Initial Provider Configuration for Proxmox

terraform {
 required_providers {
    proxmox = {
      source  = "TheGameProfi/proxmox"
      version = "2.9.15"
    }
  }
}

provider "proxmox" {
  # (Optional) Skip TLS Verification
  pm_tls_insecure = true
}
