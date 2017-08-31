variable boot_volume_image_list {
  description = "The Image List to use for the boot volume. Defaults to Oracle Linux 7.2 UEK4."
  default     = "/oracle/public/OL_7.2_UEKR4_x86_64"
}

variable boot_volume_image_list_entry {
  description = "(Optional) The Image List Entry to use for the boot volume."
  default     = 1
}

variable boot_volume_size {
  description = "Size in GB of the boot storage volume."
  default     = 12
}

variable instance_name {
  description = "Instance name."
}

variable instance_hostname {
  description = "(Optional) Instance hostname. Defaults to the instance name."
  default     = ""
}

variable instance_label {
  description = "(Optional) Instance label. Defaults to the instance name."
  default     = ""
}

variable instance_shape {
  description = "Instance shape."
}

variable instance_attributes {
  description = "(Optional) A JSON string of custom attributes."
  default     = ""
}

variable reverse_dns {
  description = "(Optional) create reverse DNS records."
  default     = true
}

variable ip_reservation {
  description = "(Optional) IP Address Reservation."
  default     = ""
}

variable dns {
  type        = "list"
  description = "(Optional) List of DNS servers."
  default     = []
}

variable search_domains {
  type        = "list"
  description = "(Optional) Search domains."
  default     = []
}

variable ssh_keys {
  type        = "list"
  description = "(Optional) List of SSH Key names."
  default     = []
}

variable tags {
  type        = "list"
  description = "(Optional) list of tags to apply to all resources."
  default     = []
}
