module "dev"{
    source = "../vm_modules"
    rg_name = "rgdev"
    rg_location = "eastus"
    my_nsg = "mynsg"
    my_vnet = "mvnet"
    my_addressspace = ["10.0.0.0/16"]
    my_subnet = "subnet"
    my_addressprefixes = ["10.0.0.0/24"]
    my_vm = "vmachine"
    vm_size = "Standard_B1s"
}