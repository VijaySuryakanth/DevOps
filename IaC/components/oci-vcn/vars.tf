
# Identity and access parameters
variable "api_fingerprint" {
  description = "Fingerprint of oci api private key."
  type        = string
  default     = ""
}

variable "api_private_key_path" {
  description = "The path to oci api private key."
  type        = string
  default     = ""
}

variable "region" {
  # List of regions: https://docs.cloud.oracle.com/iaas/Content/General/Concepts/regions.htm#ServiceAvailabilityAcrossRegions
  description = "The oci region where resources will be created."
  type        = string
  default     = ""
}

variable "tenancy_id" {
  description = "The tenancy id in which to create the resources."
  type        = string
  default = ""
}

variable "user_id" {
  description = "The id of the user that terraform will use to create the resources."
  type        = string
  default = ""
}

variable compartment_id { 
  description = "The OCI compartment id to create resources"
  type        = string
  default = "ocid1.compartment.oc1" 
}

variable "vcn_name" {
  type = string
  default = "test_vcn"
}

variable "vcn_dns_label" {
  type = string
  default = "test_vcn"
}

variable "vcn_cidr_block" {
  type = string
  default = "10.10.0.0/16"
}

variable internet_gateway_display_name {
  type = string
  default = "ig"
}

variable label_prefix {
  type = string
  default = "none"
}

variable subnet_cidr_block {
  type = string
  default = "10.10.0.0/24"
}

variable subnet_name {
  type = string
  default = "test_sn"
}

variable create_internet_gateway {
  type = bool
  default = false
}


variable nat_gateway_display_name {
  type = string
  default = "natgtw"
}

variable create_nat_gateway {
  type = bool
  default = false
}

variable service_gateway_display_name {
  type = string
  default = "svcgtw"
}

variable create_service_gateway {
  type = bool
  default = false
}

variable "internet_gateway_route_rules" {
  description = "(Updatable) List of routing rules to add to Internet Gateway Route Table"
  type        = list(map(string))
  default     = null
}

variable "nat_gateway_route_rules" {
  description = "(Updatable) list of routing rules to add to NAT Gateway Route Table"
  type        = list(map(string))
  default     = null
}

variable "attached_drg_id" {
  description = "the ID of DRG attached to the VCN"
  type = string
  default = null
}

variable "nat_gateway_public_ip_id" {
  description = "OCID of reserved IP address for NAT gateway. The reserved public IP address needs to be manually created."
  default     = "none"
  type        = string
}

variable "lockdown_default_seclist" {
  type    = bool
  default = false
}