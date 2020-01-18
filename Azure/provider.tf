provider "azurerm" { 
    version = "1.27" 
}


resource "azurerm_resource_group" "web_server_rg" { 
  name = "web-rg" 
  location = "westus2" 
} 

resource "azurerm_virtual_network" "vnet1" { 
  name = "vnet1" 
  location = "westus2" 
  resource_group_name = "${azurerm_resource_group.web_server_rg.name}" 
  address_space = ["10.0.0.0/16"] 
} 


## it will create a subnet private
resource "azurerm_subnet" "private" { 
  name = "private" 
  resource_group_name = "${azurerm_resource_group.web_server_rg.name}" 
  virtual_network_name = "${azurerm_virtual_network.vnet1.name}" 
  address_prefix = "10.0.1.0/24" 
} 


resource "azurerm_network_security_group" "sec_group1" { 
  name = "sec_group1" 
  location = "${azurerm_resource_group.web_server_rg.location}" 
  resource_group_name = "${azurerm_resource_group.web_server_rg.name}" 
  security_rule { 
   name = "test123" 
   priority = 100 
   direction = "Inbound" 
   access = "Allow" 
   protocol = "Tcp" 
   source_port_range = "*" 
   destination_port_range = "*" 
   source_address_prefix = "*" 
  destination_address_prefix = "*" 
} 
  tags = { 
    environment = "Production" 
  } 
} 


## Added a NIC cards

resource "azurerm_network_interface" "nic1" { 
  name = "nic1" 
  location = "westus2" 
  resource_group_name = "${azurerm_resource_group.web_server_rg.name}" 
  ip_configuration { 
    name = "testconfiguration1" 
    subnet_id = "${azurerm_subnet.private.id}" 
    private_ip_address_allocation = "Dynamic" 
    public_ip_address_id = "${azurerm_public_ip.IP.id}" 
  } 
} 

resource "azurerm_public_ip" "IP" { 
  name = "public_ip" 
  location = "westus2" 
  resource_group_name = "${azurerm_resource_group.web_server_rg.name}" 
  allocation_method = "Dynamic" 
} 

resource "azurerm_virtual_machine" "vm1" { 
  name = "vm1" 
  location = "westus2" 
  resource_group_name = "${azurerm_resource_group.web_server_rg.name}" 
  network_interface_ids = ["${azurerm_network_interface.nic1.id}"] 
  vm_size = "Standard_DS1_v2" 
  storage_image_reference { 
    publisher = "OpenLogic" 
    offer = "CentOS" 
    sku = "7.5" 
    version = "latest" 
} 
  storage_os_disk { 
  name = "myosdisk1" 
  caching = "ReadWrite" 
  create_option = "FromImage" 
  managed_disk_type = "Standard_LRS" 
} 
  os_profile { 
    computer_name = "vm1" 
    admin_username = "centos" 
    admin_password = "Password1234!" 
} 
  os_profile_linux_config { 
  disable_password_authentication = false 
} 
  tags { 
    environment = "staging" 
  } 
} 


# VM 2 

resource "azurerm_network_interface" "nic2" { 
  name = "nic2" 
  location = "westus2" 
  resource_group_name = "${azurerm_resource_group.web_server_rg.name}" 
  ip_configuration { 
    name = "testconfiguration2" 
    subnet_id = "${azurerm_subnet.private.id}" 
    private_ip_address_allocation = "Dynamic" 
    public_ip_address_id = "${azurerm_public_ip.IP2.id}" 
  } 
} 

 

resource "azurerm_public_ip" "IP2" { 
  name = "public_ip2" 
  location = "westus2" 
  resource_group_name = "${azurerm_resource_group.web_server_rg.name}" 
  allocation_method = "Dynamic" 
} 

 


resource "azurerm_virtual_machine" "vm2" { 
  name = "vm2" 
  location = "westus2" 
  resource_group_name = "${azurerm_resource_group.web_server_rg.name}" 
  network_interface_ids = ["${azurerm_network_interface.nic2.id}"] 
  vm_size = "Standard_DS1_v2" 
  storage_image_reference { 
  publisher = "OpenLogic" 
  offer = "CentOS" 
  sku = "7.5" 
  version = "latest" 
} 
storage_os_disk { 
  name = "myosdisk2" 
  caching = "ReadWrite" 
  create_option = "FromImage" 
  managed_disk_type = "Standard_LRS" 
} 
os_profile { 
  computer_name = "vm2" 
  admin_username = "centos" 
} 
os_profile_linux_config { 
  disable_password_authentication = true 
  ssh_keys { 
  path = "/home/centos/.ssh/authorized_keys" 
  key_data = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDtPp3igHqhEn0UL+fk/3laavqf9/5VbSoRO1F8KMEHlQyoKXbBfL9tyJD/MEyQBe0vICFmaOvXaGuI1sIX7Lf0Tdx4qFGtoxjtbBCR7HjmXX2+ICv1xdeOtjjWCoIKDbmKDsaWI05oIBQk1DGeAAOk7D3tHQxPGXDph+j+oCiZHV3CgNG3iljMwlcyubV8JeGtwKT4iyb5sxC5kE8RzJmCPdc7nYQkMGPQIxHdpNvGNOYVis+cGspfDF/Ek1GBjenbjK7CfyNXk4FZWfY+jMVNzJ6KZ0BzXXH0q+FloyfB86Wkc3rqjGnua3ci4zqRNmzrW50qIFAj7GQBI/kfgt8Z root@terraform-machine" 
  } 
} 
tags { 
   environment = "staging" 
  } 
} 

 