variable "resource_group_location" {
  type        = string
  default     = "westeurope"
  description = "Location of the resource group."
}

variable "resource_group_name" {
  type        = string
  default     = "rg-ESGI-criniergaudard"
  description = "Ressource group name."
}

variable "registry_name" {
  type        = string
  default     = "ESGIacr"
  description = "Registry ressource name."
}

variable "kube_cluster_name" {
  type        = string
  default     = "ESGIkubecluster"
  description = "Kubernetese cluster name."
}

variable "kube_cluster_dns_prefix" {
  type        = string
  default     = "esgikube"
  description = "Kubernetese DNS prefix."
}

variable "publicip_name" {
  type        = string
  default     = "esgipublicip"
  description = "Public IP name."
}