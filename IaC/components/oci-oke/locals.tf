# Copyright 2017, 2021 Oracle Corporation and/or affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

locals {

  compartment             = var.env_param["${var.env}"]
  network_compartment_id  = var.env_param["${var.env}"].network_compartment_id
  ssh_public_key_path     = var.env_param["${var.env}"].ssh_public_key_path
  vcn_id                  = var.env_param["${var.env}"].vcn_id
  nat_route_id            = var.env_param["${var.env}"].nat_rt_id
  ig_route_id             = var.env_param["${var.env}"].ig_rt_id
  subnets                 = var.subnets["${var.env}"]
  cluster_name            = var.env_param["${var.env}"].cluster_name
  env_prefix              = "${var.env}"

  validate_drg_input = var.create_drg && (var.drg_id != null) ? tobool("[ERROR]: create_drg variable can not be true if drg_id is provided.]") : true
}
