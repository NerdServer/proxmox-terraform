terraform {
  backend "git" {
    repository = var.repo
    branch     = "main"
    path       = "./terraform.tfstate"

    # Use a Personal Access Token (PAT) for authentication
    token      = var.pat
  }

  required_providers {
    proxmox = {
      source  = "TheGameProfi/proxmox"
      version = "2.9.16"
    }
  }
}

provider "proxmox" {
  pm_api_url          = var.proxmox_api_url
  pm_api_token_id     = var.proxmox_api_token_id
  pm_api_token_secret = var.proxmox_api_token_secret

  # (Optional) Skip TLS Verification
  pm_tls_insecure = true
}

# The rest of your Terraform configuration...
