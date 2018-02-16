mmodule mycompute {
    source = "Azure/compute/azurerm"
    resource_group_name = "${var.resource_group_name}"
    location = "${var.location}"
    admin_username = "${var.adminuser}"
    ssh_key = "~/.ssh/id_rsa.pub"
    vm_os_simple = "RedHat"
    remote_port = "22"
    nb_instances = 1
    public_ip_address_allocation = "dynamic"
    public_ip_dns = ["venerari123"]
    vnet_subnet_id = "${module.network.vnet_subnets[0]}"
    storage_account_type = "Standard_LRS"
}

module "network" {
    source = "Azure/network/azurerm"
    location = "${var.location}"
    resource_group_name = "${var.resource_group_name}"
    
}
