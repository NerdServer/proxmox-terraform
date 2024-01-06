# Proxmox Provider
# ---
# Initial Provider Configuration for Proxmox

  

terraform {
backend "git" {
    path       = "lxc-multi/state/terraform.tfstate"

required_version = ">= 0.13.0"

required_providers {
proxmox = {
source = "TheGameProfi/proxmox"
version = "2.9.15"
}
}
}

provider "proxmox" {
# (Optional) Skip TLS Verification
 pm_tls_insecure = true
}
