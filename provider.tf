terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 3.87.0"
    }

    tls = {
      source = "hashicorp/tls"
      version = "~> 4.0.4"
    }
  }
}

provider "azurerm" {
  features {}

  client_id       = "5cfd5092-8ede-4841-b3fb-56245200ab93"
  client_secret   = "bj08Q~DX7s3hhKFpozKJ-ACVWpwikVIfTD5cMbTF"
  tenant_id       = "e71f06b4-ce8c-42e8-a7e4-582dce3c3f57"
  subscription_id = "eb245505-9f45-4074-9d46-7e88e7159837"
}
