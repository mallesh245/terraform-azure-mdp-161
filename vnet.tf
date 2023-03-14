# virtual network
resource "azurerm_virtual_network" "web-vnet" {
  name                = "web-network"
  location            = azurerm_resource_group.web-rg.location
  resource_group_name = azurerm_resource_group.web-rg.name
  address_space       = ["10.0.0.0/16"]
  tags = {
    env  = "dev"
    tier = "frontend"
  }
}
# subnet
resource "azurerm_subnet" "web-subnet" {
  name                 = "web-subnet"
  resource_group_name  = azurerm_resource_group.web-rg.name
  virtual_network_name = azurerm_virtual_network.web-vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# network security group
resource "azurerm_network_security_group" "web-rg" {
  name                = "web-nsg"
  location            = azurerm_resource_group.web-rg.location
  resource_group_name = azurerm_resource_group.web-rg.name
  tags = {
    env = "dev"
  }
}