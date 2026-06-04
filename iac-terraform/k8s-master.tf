resource "yandex_kubernetes_cluster" "k8s" {
  name        = "k8s"

  network_id = yandex_vpc_network.terraform.id

  cluster_ipv4_range = "172.16.1.0/22"
  service_ipv4_range = "172.16.128.0/22"
  node_ipv4_cidr_mask_size = 25
  release_channel = "REGULAR"

  master {

    master_location {
        subnet_id = yandex_vpc_subnet.terraform_a.id
        zone      = yandex_vpc_subnet.terraform_a.zone
    }
    master_location {
        subnet_id = yandex_vpc_subnet.terraform_b.id
        zone      = yandex_vpc_subnet.terraform_b.zone
    }
    master_location {
        subnet_id = yandex_vpc_subnet.terraform_d.id
        zone      = yandex_vpc_subnet.terraform_d.zone
    }

    version   = "1.33"
    public_ip = false

    maintenance_policy {
      auto_upgrade = false
    }

    master_logging {
      enabled                    = false
    }

    scale_policy {
      auto_scale {
        min_resource_preset_id = "s-c2-m8"
      }
    }
  }

  service_account_id      = yandex_iam_service_account.service-acc.id
  node_service_account_id = yandex_iam_service_account.service-acc.id

  network_implementation {
    cilium {}
  } 
}