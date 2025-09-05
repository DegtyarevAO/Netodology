resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

# node 1

data "yandex_compute_image" "worker1" {
  family = var.vm_family
}
resource "yandex_compute_instance" "worker-1" {
  name = local.vm_name_worker1
  platform_id = var.vm_platform_id
  zone = var.default_zone
  resources {
    cores = var.config["worker"].cores 
    memory = var.config["worker"].memory
    core_fraction = var.config["worker"].core_fraction
  }
boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.worker1.image_id
    }
  }

  scheduling_policy {
    preemptible = true
  }
  
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }
  
  metadata = {
    serial-port-enable = var.metadata.serial-port-enable
    ssh-keys           = var.metadata.ssh-keys
  }
}


## node 2

data "yandex_compute_image" "worker2" {
  family = var.vm_family
}
resource "yandex_compute_instance" "worker-2" {
  name = local.vm_name_worker2
  platform_id = var.vm_platform_id
  zone = var.default_zone
  resources {
    cores = var.config["worker"].cores 
    memory = var.config["worker"].memory
    core_fraction = var.config["worker"].core_fraction
  }
boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.worker2.image_id
    }
  }

  scheduling_policy {
    preemptible = true
  }
  
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }
  
  metadata = {
    serial-port-enable = var.metadata.serial-port-enable
    ssh-keys           = var.metadata.ssh-keys
  }
}

## node 3 arbiter


data "yandex_compute_image" "arbitr" {
  family = var.vm_family
}
resource "yandex_compute_instance" "arbitr" {
  name = local.vm_name_arbitr
  platform_id = var.vm_platform_id
  zone = var.default_zone
  resources {
    cores = var.config["arbitr"].cores 
    memory = var.config["arbitr"].memory
    core_fraction = var.config["arbitr"].core_fraction
  }
boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.arbitr.image_id
    }
  }

  scheduling_policy {
    preemptible = true
  }
  
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }
  
  metadata = {
    serial-port-enable = var.metadata.serial-port-enable
    ssh-keys           = var.metadata.ssh-keys
  }
}

