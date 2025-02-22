variable "rg_name"{
    type = string
}

variable "rg_location"{
    type = string
}

variable "my_nsg"{
    type = string
}

variable "my_vnet"{
    type = string
}

variable "my_addressspace"{
    type = list(string)
}

variable "my_subnet" {
  type = string
}

variable "my_addressprefixes" {
  type = list(string)
}

variable "my_vm" {
  type = string
}

variable "vm_size" {
  type = string
}