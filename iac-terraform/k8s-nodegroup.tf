resource "yandex_kubernetes_node_group" "k8s-workers" {
  cluster_id  = yandex_kubernetes_cluster.k8s.id
  name        = "k8s-workers"
  version     = "1.33"

  instance_template {
    platform_id = "standard-v4a"

    network_interface {
      nat        = false
      subnet_ids = ["${yandex_vpc_subnet.terraform_a.id}", "${yandex_vpc_subnet.terraform_b.id}", "${yandex_vpc_subnet.terraform_d.id}"]
    }

    resources {
      memory = 4
      cores  = 2
    }

    boot_disk {
      type = "network-ssd"
      size = 64
    }

    scheduling_policy {
      preemptible = false
    }

    container_runtime {
      type = "containerd"
    }
  }

  scale_policy {
    fixed_scale {
      size = 3
    }
  }

  allocation_policy {
    location {
      zone = var.default_zone_d
    }
    location {
      zone = var.default_zone_a
    }
    location {
      zone = var.default_zone_b
    }
  }

  maintenance_policy {
    auto_upgrade = false
    auto_repair  = false
  }
}