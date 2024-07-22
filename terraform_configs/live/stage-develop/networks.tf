#----- Настройка сети и подсети
#   -- Внутрення сеть
resource "yandex_vpc_network" "netology" {
  name        = "netology"
  description = "Внутрення сеть"
}

resource "yandex_vpc_subnet" "netology-ru-central1-b" {
  name           = "netology-ru-central1-b"
  v4_cidr_blocks = ["10.129.0.0/24"]
  zone           = var.location-zone_ru-central1-b
  network_id     = yandex_vpc_network.netology.id
  description    = "Базовая подсеть"
}

resource "yandex_vpc_subnet" "netology-ru-central1-a" {
  name           = "netology-ru-central1-a"
  v4_cidr_blocks = ["10.128.0.0/24"]
  zone           = var.location-zone_ru-central1-a
  network_id     = yandex_vpc_network.netology.id
  description    = "Базовая подсеть"
}

resource "yandex_vpc_subnet" "netology-ru-central1-d" {
  name           = "netology-ru-central1-d"
  v4_cidr_blocks = ["10.130.0.0/24"]
  zone           = var.location-zone_ru-central1-d
  network_id     = yandex_vpc_network.netology.id
  description    = "Базовая подсеть"
}