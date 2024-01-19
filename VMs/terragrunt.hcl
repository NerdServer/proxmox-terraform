terraform {
  source = "github.com/NerdServer/proxmox-terraform-modules//VMs?ref=main"
}




inputs = {
vms = {
  m1 = { target_node = "nerd-pve01", vcpu = "4", memory = "16384", disk_size = "30", name = "ZUES-01", ip = "10.0.40.21", gw = "10.0.40.1" , tags = "ubuntu"}
  #m2 = { target_node = "nerd-pve02", vcpu = "4", memory = "16384", disk_size = "30", name = "ZUES-02", ip = "10.0.40.22", gw = "10.0.40.1" , ip2 = "10.0.50.22" , tags = "ubuntu"},
  #m3 = { target_node = "nerd-pve03", vcpu = "4", memory = "16384", disk_size = "30", name = "ZUES-03", ip = "10.0.40.23", gw = "10.0.40.1" , ip2 = "10.0.50.23" , tags = "ubuntu"},
  #m4 = { target_node = "nerd-pve01", vcpu = "20", memory = "120000", disk_size = "500", name = "HADES-01", ip = "10.0.40.31", gw = "10.0.40.1" , ip2 = "10.0.50.31" , tags = "ubuntu"},
  #m5 = { target_node = "nerd-pve02", vcpu = "20", memory = "120000", disk_size = "500", name = "HADES-02", ip = "10.0.40.32", gw = "10.0.40.1" , ip2 = "10.0.50.32" , tags = "ubuntu"},
  #m6 = { target_node = "nerd-pve03", vcpu = "20", memory = "120000", disk_size = "500", name = "HADES-03", ip = "10.0.40.33", gw = "10.0.40.1" , ip2 = "10.0.50.33" , tags = "ubuntu"}
  }

}