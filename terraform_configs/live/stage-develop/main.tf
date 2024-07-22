terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }

  required_version = ">= 0.13"
}

provider "yandex" {
  zone = var.location-zone_ru-central1-b
}

data "yandex_compute_image" "ubuntu" {
  family = "ubuntu-2204-lts"
}
