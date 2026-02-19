terraform {
  source = "github.com/NerdServer/proxmox-terraform-modules//Containers?ref=main"
}

inputs = {
  lxc_containers = yamldecode(file("lxc.yaml"))
}
