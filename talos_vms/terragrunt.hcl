terraform {
  source = "github.com/NerdServer/proxmox-terraform-modules//VMs?ref=main"
}

inputs = {
  vms = {
    m1 = { target_node = "nerd-pve01", cpu_cores = "4", memory_mb = "16384", disk_size = "30", name = "ZUES_cp_01", ip = "10.0.40.21", default_gateway = "10.0.40.1"},
    m1 = { target_node = "nerd-pve01", cpu_cores = "4", memory_mb = "16384", disk_size = "30", name = "HADES_worker_01", ip = "10.0.40.31", default_gateway = "10.0.40.1"},
  }
}