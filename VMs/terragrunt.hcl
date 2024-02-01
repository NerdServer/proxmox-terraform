terraform {
  source = "github.com/NerdServer/proxmox-terraform-modules//VMs?ref=main"
}

inputs = {
  vms = {
    m1 = { target_node = "nerd-pve01", vcpu = "4", memory = "16384", disk_size = "30", name = "ZUES-01", ip = "10.0.40.21", gw = "10.0.40.1", tags = "ubuntu", source_template = "ubuntu22-04-template" },
    m2 = { target_node = "nerd-pve02", vcpu = "4", memory = "16384", disk_size = "30", name = "ZUES-02", ip = "10.0.40.22", gw = "10.0.40.1", tags = "ubuntu", source_template = "ubuntu22-04-template" },
    m3 = { target_node = "nerd-pve03", vcpu = "4", memory = "16384", disk_size = "30", name = "ZUES-03", ip = "10.0.40.23", gw = "10.0.40.1", tags = "ubuntu", source_template = "ubuntu22-04-template" },
    m4 = { target_node = "nerd-pve01", vcpu = "4", memory = "16384", disk_size = "50", name = "HADES-01", ip = "10.0.40.31", gw = "10.0.40.1", tags = "ubuntu", source_template = "ubuntu22-04-template" },
    m5 = { target_node = "nerd-pve02", vcpu = "4", memory = "16384", disk_size = "50", name = "HADES-02", ip = "10.0.40.32", gw = "10.0.40.1", tags = "ubuntu", source_template = "ubuntu22-04-template" },
    m6 = { target_node = "nerd-pve03", vcpu = "4", memory = "16384", disk_size = "50", name = "HADES-03", ip = "10.0.40.33", gw = "10.0.40.1", tags = "ubuntu", source_template = "ubuntu22-04-template" },
    m7 = { target_node = "nerd-pve03", vcpu = "4", memory = "16384", disk_size = "50", name = "JV-01", ip = "10.0.40.34", gw = "10.0.40.1", tags = "ubuntu", source_template = "ubuntu22-04-template" },
    m8 = { target_node = "nerd-pve03", vcpu = "4", memory = "16384", disk_size = "50", name = "JV-02", ip = "10.0.40.35", gw = "10.0.40.1", tags = "ubuntu", source_template = "ubuntu22-04-template" }
  }
}