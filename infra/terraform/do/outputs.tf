output "devops_stand_IP" {
  value = "${digitalocean_droplet.devops.ipv4_address}"
}
