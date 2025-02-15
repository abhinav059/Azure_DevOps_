variable "location" {
  description = "Azure region"
  type        = string
  default     = "eastus"
}

variable "resource_group_name" {
  description = "Azure Resource Group Name"
  type        = string
}

variable "acr_name" {
  description = "Azure Container Registry Name"
  type        = string
}

variable "container_name" {
  description = "Container App Name"
  type        = string
}

variable "dns_label" {
  description = "DNS Label for public access"
  type        = string
}

variable "image_tag" {
  description = "Container Image Tag"
  type        = string
  default     = "latest"
}
