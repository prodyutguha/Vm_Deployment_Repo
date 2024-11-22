############## Creating VM using Service Now #############################

resource "azurerm_resource_group" "RG" {
  name     = "Window_Server_Prodyut"
  location = "East US"
}

resource "azurerm_virtual_network" "VN" {
  name                = "${var.vm_name}-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.RG.location
  resource_group_name = azurerm_resource_group.RG.name
}

resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.RG.name
  virtual_network_name = azurerm_virtual_network.VN.name
  address_prefixes     = ["10.0.0.0/24"]
}

resource "azurerm_public_ip" "public_ip" {
  name                = "${var.vm_name}-publicIP"
  resource_group_name = azurerm_resource_group.RG.name
  location            = azurerm_resource_group.RG.location
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "NI" {
  name                = "${var.vm_name}-nic"
  location            = azurerm_resource_group.RG.location
  resource_group_name = azurerm_resource_group.RG.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }
}

resource "azurerm_windows_virtual_machine" "machin" {
  name                = "${var.vm_name}"
  resource_group_name = azurerm_resource_group.RG.name
  location            = "${var.location}"
  size                = "${var.vm_size}"
  admin_username      = "${var.admin_username}"
  admin_password      = "${var.admin_password}"
  network_interface_ids = [
    azurerm_network_interface.NI.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
    disk_size_gb         = "512"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-datacenter-g2"
    version   = "latest"
  }
}

resource "azurerm_monitor_action_group" "main" {
  name                = "Aztiongroup-Cpu-Utlization"
  resource_group_name = azurerm_resource_group.RG.name
  short_name          = "exampleact"

  webhook_receiver {
    name        = "callmyapi"
    service_uri = "http://example.com/alert"
  }
}

resource "azurerm_monitor_metric_alert" "alert_cpu_utlization" {
  name                  = "Alert_Cpu-Utlization"
  resource_group_name   = azurerm_resource_group.RG.name
  scopes                = [azurerm_resource_group.RG.id]
  description           = "description"
  target_resource_type  = "Microsoft.Compute/virtualMachines"
  target_resource_location = "${var.location_name}"
  window_size           = "PT15M" #lookback period#
  frequency             = "PT5M" #check every#
  severity              = 0

  
  criteria { 
    metric_namespace = "Microsoft.Compute/virtualMachines"
    metric_name      = "Percentage CPU"
    aggregation      = "Maximum"
    operator         = "GreaterThan"
    threshold        = 40
    #skip_metric_validation = true
  }

  action {
    action_group_id = azurerm_monitor_action_group.main.id
  }
}


resource "azurerm_managed_disk" "data_disk" {
  name                 = "DataDisk-Window-VM-disk1"
  location             = azurerm_resource_group.RG.location
  resource_group_name  = azurerm_resource_group.RG.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "128"
}

resource "azurerm_virtual_machine_data_disk_attachment" "data_disk-att" {
  managed_disk_id    = azurerm_managed_disk.data_disk.id
  virtual_machine_id = azurerm_windows_virtual_machine.machin.id
  lun                = "0"
  caching            = "ReadWrite"
}
