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
