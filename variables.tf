# variable "classifications_to_include" {
#   type = list(string)
#   default = [ "Critical", "Security", "UpdateRollup", "FeaturePack", "ServicePack", "Definition", "Updates" ]
# }

# variable "kb_number_to_exclude" {
#   type = list(string)
#   default = []
# }

# variable "kb_number_to_include" {
#   type = list(string)
#   default = [ "5034439", "2267602", "5024127", "4589208" ]
# }

# variable "start_date_time" {
#   type = string
#   default = "2025-12-24 18:00"
# }

# variable "expiration_date_time" {
#   type = string
#   default = "2025-12-24 20:00"
# }

# variable "Patch_Group_ID" {
#   type = map(object({
#     start_date_time = string
#     expiration_date_time  = string
#     recur_every = string
#   }))
# }

# variable "tags" {
#   type = map(string)
# }

variable "vm_name" {
  description = "Name of the Virtual Machine"
  type        = string
}

variable "os_type" {
  description = "OS Type: Ubuntu or Windows"
  type        = string
}

variable "vm_size" {
  description = "VM size, e.g., Standard_G2"
  type        = string
}


variable "os_disk_size" {
  description = "OS Disk size in GB"
  type        = number
}

variable "data_disk_size" {
  description = "Optional data disk size in GB"
  type        = number
  default     = 0
}

variable "vm_login_group_name" {
  description = "Entra ID Security Group allowed to login to VM"
  type        = string
}

variable "tenant_id" {
  description = "Entra ID Tenant ID (required for AAD Login extension)"
  type        = string
  default = "33227e13-4782-47ac-9543-62baa1a210a4"
}