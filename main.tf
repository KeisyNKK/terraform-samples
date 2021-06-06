provider "azurerm"{
    version = "2.5.0"
    features {}
}

terraform {
    backend "azurerm" {
      resource_group_name   = "terraform-blobstore"
      storage_account_name  = "uuditerraformstorage"
      container_name        = "uuditfstate"
      key                   = "terraform.tfstate"
    }
}


resource "azurerm_resource_group" "lubby" {
  name                  = "lubbyrg"
  location              = "brazilsouth"
}

resource "azurerm_container_group" "kafka_consumer"{
    name                = "lubby"
    location            = azurerm_resource_group.lubby.location
    resource_group_name = azurerm_resource_group.lubby.name

    ip_address_type     = "public"
    dns_name_label      = "keisynkk"
    os_type             = "Linux"

    container {
        name = "lubby"
          image         = "keisynkk/lubby"
          cpu           = "1"
          memory        = "1"

          ports {
              port      = 80
              protocol  = "TCP"
          }
    }
}

