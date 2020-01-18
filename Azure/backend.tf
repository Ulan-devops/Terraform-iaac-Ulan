
terraform {
  backend "azurerm" {
    storage_account_name = "example1ulan"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"

    # rather than defining this inline, the Access Key can also be sourced
    # from an Environment Variable - more information is available below.
    access_key = "e25f2a8f-9b53-465f-9365-425ee0e4e70d"
  }
}