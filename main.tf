terraform {
    required_providers{
        azurerm = {
            source = "hashicorp/azurerm"
            version = "~> 3.0"
        }
    }
}
provider "azurerm" {
    features {}
}

#resource "azurerm_resource_group" "test-rg" {
#    name = var.rgname
#    location = var.region_primary
#}

resource "azurerm_storage_account" "svm_storageacc" {
  name                     = var.vnetname
   #resource_group_name      = data.terraform_remote_state.baseline.outputs.rgname
    resource_group_name     = var.rgname
  location                 = var.region_primary
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}

#data "terraform_remote_state" "baseline" {
#   backend = "remote"
#   config = {
#     organization = var.tfc_org_name
#     hostname     = var.tfc_host_name
#     workspaces = {
#       name = var.tfc_baseline_repo
##     }
#   }
# }
