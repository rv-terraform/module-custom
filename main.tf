module mycompute {
    source = "Azure/compute/azurerm"
    resource_group_name = "${var.resource_group_name}"
    location = "${var.location}"
    admin_username = "${var.adminuser}"
    ssh_key = "~/.ssh/id_rsa.pub"
    vm_os_simple = "RedHat"
    vm_os_offer  = "RHEL"
    vm_os_sku    = "7-RAW"
    remote_port = "22"
    nb_instances = 1
    public_ip_address_allocation = "dynamic"
    public_ip_dns = ["venerari03"]
    vnet_subnet_id = "${module.network.vnet_subnets[0]}"
    storage_account_type = "Standard_LRS"
    vm_size = "Standard_DS1_V2"
    tags {
        environment = "${var.environment}"
    }
}

module "network" {
    source = "Azure/network/azurerm"
    location = "${var.location}"
    resource_group_name = "${var.resource_group_name}"
    tags {
        environment = "${var.environment}"
    }
}

output "vm_public_name" {
    value = "${module.mycompute.public_ip_dns_name}"
}

output "vm_public_ip" {
    value = "${module.mycompute.public_ip_address}"
}

output "vm_private_ips" {
    value = "${module.mycompute.network_interface_private_ip}"
}
