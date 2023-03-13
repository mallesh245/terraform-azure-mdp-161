# resource group for web app project
resource "azurerm_resource_group" "web-rg" {
  name     = "web-rg"
  location = "east us"
}