
terraform {
  backend "azurerm" {
    resource_group_name  = "example1"
    storage_account_name = "example1ulan"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
    access_key = "8Sm0tMADe+K9RgnM8FetI0VwFNn4ZfPc8OBYgS5lX2LvCgQ17fMAxe6J30L3vRDPRzC7bATPyuQhec1aKv2eMw=="
  }
}
    