output "vars" {
  value = {
    for k, v in yandex_compute_instance.managers : k => {
      fqdn = v.fqdn
      ip   = v.network_interface.0.ip_address
      host = v.name
  }}
}

resource "local_file" "inventory" {
  content = templatefile("${path.module}/templates/inventory.tftpl", {
      managers = [
        for v in yandex_compute_instance.managers : {
          fqdn = v.fqdn
          ip   = v.network_interface.0.ip_address
          host = v.name
          nat_ip = v.network_interface.0.nat_ip_address
        }
      ],
      workers = [
        for v in yandex_compute_instance.worker : {
          fqdn = v.fqdn
          ip   = v.network_interface.0.ip_address
          host = v.name
          nat_ip = v.network_interface.0.nat_ip_address
        }
      ]
    }
  )
  filename = "../../../ansible_configs/inventory.yaml"
}