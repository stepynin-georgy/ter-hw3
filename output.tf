output "instances" {
  description = "Information about the instances"
  value = {
    web = [
      for instance in yandex_compute_instance.web : {
        name = instance.name
        id   = instance.id
        fqdn = instance.fqdn
      }
    ],
    for_each = [
      for instance in yandex_compute_instance.for_each : {
        name = instance.name
        id   = instance.id
        fqdn = instance.fqdn
      }
    ],
  }
}
