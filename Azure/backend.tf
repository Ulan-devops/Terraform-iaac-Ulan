terraform {
  backend "azurerm" {
    resource_group_name  = "example1"
    storage_account_name = "example1ulan"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
    subscription_id  = "e25f2a8f-9b53-465f-9365-425ee0e4e70d"
    tenant_id        = "2617bd0b-d588-42a9-b5f3-a2b431ec33e2"
  }
}