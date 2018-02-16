module mycompute {
    source = "Azure/compute/azurerm"
    resource_group_name = "${var.resource_group_name}"
    location = "${var.location}"
    admin_username = "${var.adminuser}"
    ssh_key = "~/.ssh/id_rsa.pub"
    vm_os_simple = "CentOS"
    remote_port = "22"
    nb_instances = 2
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

output "vm_public_name" {
    value = "${module.mycompute.public_ip_dns_name}"
}

output "vm_public_ip" {
    value = "${module.mycompute.public_ip_address}"
}

output "vm_private_ips" {
    value = "${module.mycompute.network_interface_private_ip}"
}
