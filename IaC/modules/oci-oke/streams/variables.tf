
variable "compartment_id" {
  type      = string
  description = "compartment to create stream service " 
}

variable "stream_pool_name" {
  type      = string
  description = "stream_pool_name " 
}

variable "stream_name" {
  type      = string
  description = "stream_name " 
}

variable "stream_partitions" {
  type      = number
  description = "stream_partitions " 
}