variable "do_token" {
  description = "DigitalOcean API Token"
}

variable "droplet_name" {
  description = "Droplet name in DigitalOcean Control Panel"
  default     = "devops"
}

variable "droplet_region" {
  description = "Datacenter region"
  default     = "fra1"
}

variable "droplet_image" {
  description = "Image distribution"
  default     = "docker-18-04"
}

variable "droplet_size" {
  description = "Droplet size"
  default     = "512mb"
}

variable "pub_key" {
  description = "Public ssh key"
  default     = "~/.ssh/id_rsa.pub"
}
variable "pvt_key" {
  description = "Private ssh key"
  default     = "~/.ssh/id_rsa"
}
variable "ssh_fingerprint" {
  description = "Fingerprint ssh key"
}
