module mycompute {
    source = "Azure/compute/azurerm"
    resource_group_name = "${var.resource_group_name}"
    location = "${var.location}"
    admin_username = "${var.adminuser}"
    remote_port = "22"
    nb_instances = 1
    vm_size = "Standard_DS1_V2"
    public_ip_dns = ["venerari03"]
    vnet_subnet_id = "${module.network.vnet_subnets[0]}"
    vm_os_simple = "RedHat"
    vm_os_offer  = "RHEL"
    vm_os_sku    = "7-RAW"
    storage_account_type = "Standard_LRS"
    ssh_key = "~/.ssh/id_rsa.pub"
  
}

module "network" {
    source = "Azure/network/azurerm"
    location = "${var.location}"
    resource_group_name = "${var.resource_group_name}"
    
}
