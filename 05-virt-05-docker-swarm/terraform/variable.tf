variable "vm_family" {
  type = string 
  default = "ubuntu-2004-lts"
  description = "yandex_compute_image, ubuntu 2004"
}

variable "vm_platform_id" {
  type = string 
  default = "standard-v1"
  description = "Platform for VM"
}

###cloud vars

variable "cloud_id" {
  type        = string
  default     = "b1gu11hlhaekvgdghiop"
}

variable "folder_id" {
  type        = string
  default     = "b1gskvdblc6ceq4ha1t3"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
}

### Network

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}


variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

### VM names

variable "project" {
  type = string
  default = "docker"
  description = "Name of project"
}

variable "contur" {
  type = string
  default = "swarm"
  description = "envirement like prod, test, develop"
}

variable "role1" {
  type = string
  default = "worker-1"
  description = "server role"
}

variable "role2" {
  type = string
  default = "worker-2"
  description = "server role"
}

variable "role3" {
  type = string
  default = "arbitr"
  description = "server role"
}

### vm config

variable "config" {
  type = map(object({
    memory = number
    cores = number
    core_fraction = number
  }))
  default = {
    "worker" = {
      cores = 2
      memory  = 2
      core_fraction = 100

    },
    "arbitr" = {
      cores = 2
      memory  = 1
      core_fraction = 20

    }
  }
}


### Metadata

  variable "metadata" {
  type = map
  default = {
    serial-port-enable = 1
    ssh-keys = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAII/m1x2X9YJVrBf4sUmEt+SUxBYY6xo5Hrwzf5RnrkwC degtj@DESKTOP-O38U7GH"
  }
}
deg
