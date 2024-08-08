###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  default     = "b1gpidh9fbq31fqojvmu"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default     = "b1gbaccuaasnld9i4p6h"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "vm_web_image" {
  type        = string
  description = "OS release name"
  default     = "ubuntu-2004-lts"
}

variable "vm_web_platform_id" {
  type        = string
  description = "VM platform_id"
  default     = "standard-v1"
}

variable "vm_web_cores" {
  type        = number
  description = "VM cores"
  default     = "2"
}

variable "vm_web_memory" {
  type        = number
  description = "VM memory"
  default     = "2"
}

variable "vm_web_core_fraction" {
  type        = number
  description = "VM core fraction"
  default     = "5"
}

variable "vm_ssh_root_key" {
  type        = map(string)
  default = {
      serial-port-enable = 1
      ssh-keys           = "ubuntu:ssh-ed25519 <ssh-key>"
  }
  description = "ssh-keygen -t ed25519"
}

variable "vm_resources" {
  type = list(object({
    vm_name     = string
    cpu         = number
    ram         = number
    disk        = number
    platform_id = string
  }))
  default = [
    {
      vm_name     = "main"
      cpu         = 2
      ram         = 2
      disk        = 5
      platform_id = "standard-v1"
    },
    {
      vm_name     = "replica"
      cpu         = 2
      ram         = 2
      disk        = 10
      platform_id = "standard-v1"
    },
  ]
}