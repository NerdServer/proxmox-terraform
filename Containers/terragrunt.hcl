terraform {
  source = "github.com/NerdServer/proxmox-terraform-modules//Containers?ref=main"
}

inputs = {
  lxc_containers = try(yamldecode(file("lxc.yaml")), {})
}
