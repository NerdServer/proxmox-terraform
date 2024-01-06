terraform {

  backend "s3" { 
    bucket = "terraform.tfstates" 
    region = "main" 
    key = "tf.tfstate" 
    skip_region_validation = true 
    skip_credentials_validation = true 
    skip_requesting_account_id = true 
    use_path_style = true 
    insecure = true 
    skip_metadata_api_check = true 
    skip_s3_checksum = true 
    access_key = "4c0rKemwArm75NWThpCI" 
    secret_key = "iHhu7JenbY9OML4xBcJp6EVrVuzAfOgVEC1b1a5w" 
    endpoints = { s3 = "http://10.0.0.243:9002" } 
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

