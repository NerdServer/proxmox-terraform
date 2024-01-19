terraform {
  source = "github.com/NerdServer/proxmox-terraform-modules//VMs?ref=main"
}

inputs = {
  vms = {
    m1 = { target_node = "nerd-pve01", vcpu = "4", memory = "16384", disk_size = "30", name = "ZUES-01", ip = "10.0.40.21", gw = "10.0.40.1", tags = "ubuntu" , source_template = "ubuntu22-04-template" }
  }
}