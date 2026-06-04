resource "yandex_vpc_network" "terraform" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "terraform_a" {
  name           = "terraform_a"
  zone           = var.default_zone_a
  network_id     = yandex_vpc_network.terraform.id
  v4_cidr_blocks = var.default_cidr_a
}

resource "yandex_vpc_subnet" "terraform_b" {
  name           = "terraform_b"
  zone           = var.default_zone_b
  network_id     = yandex_vpc_network.terraform.id
  v4_cidr_blocks = var.default_cidr_b
}

resource "yandex_vpc_subnet" "terraform_d" {
  name           = "terraform_d"
  zone           = var.default_zone_d
  network_id     = yandex_vpc_network.terraform.id
  v4_cidr_blocks = var.default_cidr_d
}