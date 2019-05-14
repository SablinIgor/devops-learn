output "devops-stand-ip" {
  value = "${google_compute_instance.devops.network_interface.0.access_config.0.nat_ip}"
}
