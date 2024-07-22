
resource "yandex_compute_instance" "managers" {
    count = 3

  name        = format("manager-%02d", count.index + 1)
  hostname    = format("manager-%02d", count.index + 1)
  zone        = var.location-zone_ru-central1-b
  platform_id = "standard-v3"
  description = format("manager-%02d", count.index + 1)

  resources {
    cores         = 2
    core_fraction = 20
    memory        = 4
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size     = 30
      type     = "network-ssd"
    }
  }

  scheduling_policy {
    preemptible = true
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.netology-ru-central1-b.id
    nat                = true
  }

  metadata = {
    user-data = "${file(var.path_to_metadata_user_ssh)}"
  }
}


resource "yandex_compute_instance" "worker" {
    count = 3

  name        = format("worker-%02d", count.index + 1)
  hostname    = format("worker-%02d", count.index + 1)
  zone        = var.location-zone_ru-central1-b
  platform_id = "standard-v3"
  description = format("worker-%02d", count.index + 1)

  resources {
    cores         = 2
    core_fraction = 20
    memory        = 4
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size     = 30
      type     = "network-ssd"
    }
  }

  scheduling_policy {
    preemptible = true
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.netology-ru-central1-b.id
    nat                = true
  }

  metadata = {
    user-data = "${file(var.path_to_metadata_user_ssh)}"
  }
}
