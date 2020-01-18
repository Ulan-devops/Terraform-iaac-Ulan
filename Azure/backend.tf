
terraform {
  backend "azurerm" {
    resource_group_name  = "StorageAccount-ResourceGroup"
    storage_account_name = "abcd1234"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
    access_key = "8Sm0tMADe+K9RgnM8FetI0VwFNn4ZfPc8OBYgS5lX2LvCgQ17fMAxe6J30L3vRDPRzC7bATPyuQhec1aKv2eMw=="
  }
}
    