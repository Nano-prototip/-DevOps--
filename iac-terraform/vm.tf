//
// Create a new Compute Instance
//
resource "yandex_compute_instance" "worker-vm" {
  name        = "worker-vm"
  platform_id = "standard-v4a"
  zone        = var.default_zone_a

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    disk_id = yandex_compute_disk.disk-ubuntu-24-04-lts.id
  }

  network_interface {
    index     = 0
    subnet_id = yandex_vpc_subnet.terraform_a.id
    security_group_ids = ["enpueuhs9gum3521aul4"]
    nat = true
  }

    metadata                  = {
      "ssh-keys"  = "worker-acc:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC1fkWShMbsopijUfzbw0gglnafdfcfZZWDx4FHksLrVa+P+otGpLvceB2zecg4t+OfCvWtjd+iav1NbbaeTyDjqsLiRY2r+kBfqvI7golw0cEDAzIjemoUxVS41At8yv/+/m7ri7eSX10Q1s6JbBUTBpGIfjTYiVpH1T/zcLQ2F4KFnDIB6VOJLwdBsbEwQzOSJ+2Aqm+50RIzzAQmB21nwGV4En1dxxq9+dAy+J1tY8QxvER6Y3S4GhKBW2AM7XGeLPysC+5elvcOPTBitQiuX5Iv6wMHK5E6GFHrV5gz24d2j5gDfDSq5ZxgsM7cN+oHEQuwszTRISdXXDT+9S5l"
      "user-data" = <<-EOF
#cloud-config
datasource:
 Ec2:
  strict_id: false
ssh_pwauth: no
users:
- name: worker-acc
  sudo: ALL=(ALL) NOPASSWD:ALL
  shell: /bin/bash
  ssh_authorized_keys:
  - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC1fkWShMbsopijUfzbw0gglnafdfcfZZWDx4FHksLrVa+P+otGpLvceB2zecg4t+OfCvWtjd+iav1NbbaeTyDjqsLiRY2r+kBfqvI7golw0cEDAzIjemoUxVS41At8yv/+/m7ri7eSX10Q1s6JbBUTBpGIfjTYiVpH1T/zcLQ2F4KFnDIB6VOJLwdBsbEwQzOSJ+2Aqm+50RIzzAQmB21nwGV4En1dxxq9+dAy+J1tY8QxvER6Y3S4GhKBW2AM7XGeLPysC+5elvcOPTBitQiuX5Iv6wMHK5E6GFHrV5gz24d2j5gDfDSq5ZxgsM7cN+oHEQuwszTRISdXXDT+9S5l
                    EOF
    }
}