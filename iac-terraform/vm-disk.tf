resource "yandex_compute_disk" "disk-ubuntu-24-04-lts" {
  name      = "disk-ubuntu-24-04-lts"
  folder_id = var.folder_id
  type      = "network-ssd"
  size      = 20
  zone      = var.default_zone_a
  image_id  = "fd89mp67446a6rcc4s08"
}