terraform {
  source = "github.com/NerdServer/proxmox-terraform-modules//VMs?ref=main"
}

inputs = {
  vms = try(yamldecode(file("vms.yaml")), {})
}