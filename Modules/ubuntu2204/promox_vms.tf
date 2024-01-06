resource "proxmox_virtual_environment_vm" "vms" {
  for_each    = var.vms
  name        = each.value.name
  desc        = each.value.name
  node_name = each.value.target_node
  os_type     = "cloud-init"
  full_clone  = true
  memory      = each.value.memory
  sockets     = "1"
  cores       = each.value.vcpu
  cpu         = "host"
  scsihw      = "virtio-scsi-single"
  clone       = "ubuntu22-04-template"
  agent       = 1
  disk {
    size    = each.value.disk_size
    type    = "virtio"
    storage = "pve-iscsi-lun0"
  }
  network {
    model  = "virtio"
    bridge = "vmbr0"
    tag = "40"
  }

  # Cloud-init section
  ipconfig0 = "ip=${each.value.ip}/24,gw=${each.value.gw}"
  ipconfig1 = "ip=${each.value.ip2}/24"
  ssh_user  = var.ssh_user
  sshkeys   = var.ssh_pub_key
  ciuser = var.ciuser
  cipassword = var.cipassword


  
 # Adding tags from variables
  tags = each.value.tags

}




