variable "resource_group_name"{
    type = string
}

variable "resource_group_location"{
    type = string
}

variable "network_security_group"{
    type = string
}

variable "virtual_network_name"{
    type = string
}

variable "vnet_address_space"{
    type = list(string)
}

variable "subnet_name"{
    type = string
}

variable "subnet_address_prefixes"{
    type = list(string)
}

variable "nic_card_name"{
    type = string
}

variable "virtual_machine_name"{
    type = string
}

variable "virtual_machine_size"{
    type = string
}