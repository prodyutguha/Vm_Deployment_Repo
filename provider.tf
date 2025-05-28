# terraform {
#   required_providers {
#     azurerm = {
#       source  = "hashicorp/azurerm"
#       version = ">= 4.10.0"
#     }

#     random = {
#       source = "hashicorp/random"
#       version = "3.4.3"
#     }

#     tls = {
#       source = "hashicorp/tls"
#       version = "~> 4.0.4"
#     }
#   }
# }



# terraform {
#   required_providers {
#     azurerm = {
#       source = "hashicorp/azurerm"
#       version = ">=4.10.0"
#     }
#   }
# }

# provider "azurerm" {
#   features {}

#   #client_id       = "5cfd5092-8ede-4841-b3fb-56245200ab93"
#   #client_secret   = "g1F8Q~MaYT8N50lYOJ~LwyzPkGlrX.0y4fgbQa8g"
#   #tenant_id       = "e71f06b4-ce8c-42e8-a7e4-582dce3c3f57"
#   #subscription_id = "eb245505-9f45-4074-9d46-7e88e7159837"
# }


# terraform {
#   required_providers {
#     azurerm = {
#       source  = "hashicorp/azurerm"
#       version = "~> 3.0"
#     }
#   }

#   required_version = ">= 1.1.0"
# }

# provider "azurerm" {
#   features {}
# }

terraform {
  backend "azurerm" {
    # resource_group_name = "RG-Terraform-Storage-Account"
    # storage_account_name = "tfstorage43blrg"
    # container_name       = "tfstate"
    key                  = "${var.vm_name}.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}
