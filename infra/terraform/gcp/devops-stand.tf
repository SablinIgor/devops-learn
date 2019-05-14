resource "google_compute_instance" "devops" {
  name         = "devops"
  machine_type = "${var.size}"
  zone         = "${var.zone}"
  tags         = ["devops"]

  # определение загрузочного диска
  boot_disk {
    initialize_params {
      image = "${var.disk_image}"
    }
  }

  # определение сетевого интерфейса
  network_interface {
    # сеть, к которой присоединить данный интерфейс
    network = "default"

    # использовать ephemeral IP для доступа из Интернет
    access_config {
    }
  }

  metadata {
    # путь до публичного ключа
    ssh-keys = "devuser:${file(var.public_key_path)}"
  }

  connection {
    type  = "ssh"
    user  = "devuser"
    agent = false

    # путь до приватного ключа
    private_key = "${file(var.private_key_path)}"
  }
}
