terraform {

backend "s3" {
    bucket = "terraform-tstates"
    key = "./lxc_ubuntu/terraform.tfstate"
    region = "main"
    endpoint = "http://10.0.0.243:9002"
        
    skip_credentials_validation = true
    skip_requesting_account_id = true
    skip_metadata_api_check = true
    skip_region_validation = true
    force_path_style            = true
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

