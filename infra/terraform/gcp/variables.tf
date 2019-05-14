variable project {
  description = "Project ID"
}

variable region {
  description = "Region"

  # Значение по умолчанию
  default = "europe-west1"
}
variable zone {
  description = "Zone"

  # Значение по умолчанию
  default = "europe-west1-b"
}
variable public_key_path {
  description = "Path to the public key used to connect to instance"
}

variable private_key_path {
  description = "Path to the private key used to connect to instance"
}
variable size {
  description = "Instance size"
}
variable disk_image {
  description = "Instance image"
}
