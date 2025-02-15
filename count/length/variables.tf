variable "resource_group_name"{
    type = string
}

variable "resource_group_location"{
    type = string
}

variable "network_security_group_name"{
    type = list(string)
}

variable "virtual_network_name"{
    type = string
}

variable "subnet_name"{
    type = list(string)
}

variable "vnet_address_space"{
    type = list(string)
}

variable "virtual_machine_name"{
    type = list(string)
}


variable "virtual_machine_size"{
    type = string
}