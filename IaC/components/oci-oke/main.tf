# Copyright 2017, 2021 Oracle Corporation and/or affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl


# additional networking for oke
module "network" {
  source = "../../modules/oci-oke/network"

  # general oci parameters
  compartment_id = local.network_compartment_id
  label_prefix   = var.label_prefix

  # oke networking parameters
  ig_route_id  = local.ig_route_id
  nat_route_id = local.nat_route_id
  env_prefix   = local.env_prefix
  subnets      = local.subnets
  vcn_id       = local.vcn_id

  # control plane endpoint parameters
  cni_type                    = var.cni_type
  control_plane_type          = var.control_plane_type
  control_plane_allowed_cidrs = var.control_plane_allowed_cidrs

  # oke worker network parameters
  allow_node_port_access       = var.allow_node_port_access
  allow_worker_internet_access = var.allow_worker_internet_access
  allow_pod_internet_access    = var.allow_pod_internet_access
  allow_worker_ssh_access      = var.allow_worker_ssh_access
  worker_type                  = var.worker_type

  # oke load balancer network parameters
  load_balancers = var.load_balancers

  # oke internal load balancer
  internal_lb_allowed_cidrs = var.internal_lb_allowed_cidrs
  internal_lb_allowed_ports = var.internal_lb_allowed_ports

  # oke public load balancer
  public_lb_allowed_cidrs = var.public_lb_allowed_cidrs
  public_lb_allowed_ports = var.public_lb_allowed_ports

  # waf integration
  enable_waf = var.enable_waf

  # fss integration
  create_fss = var.create_fss

}

/*
## cluster creation for oke
module "oke" {
  source = "../../modules/oci-oke/oke"

  # provider
  tenancy_id = var.tenancy_id

  # general oci parameters
  compartment_id = local.compartment.compartment_id
  label_prefix   = var.label_prefix

  # ssh keys
  ssh_public_key      = var.ssh_public_key
  ssh_public_key_path = local.ssh_public_key_path

  # oke cluster parameters
  cluster_kubernetes_version                              = var.kubernetes_version
  control_plane_type                                      = var.control_plane_type
  control_plane_nsgs                                      = concat(var.control_plane_nsgs, [module.network.control_plane_nsg_id])
  cluster_name                                            = local.cluster_name
  cluster_options_add_ons_is_kubernetes_dashboard_enabled = var.dashboard_enabled
  cluster_options_kubernetes_network_config_pods_cidr     = var.pods_cidr
  cluster_options_kubernetes_network_config_services_cidr = var.services_cidr
  cluster_subnets                                         = module.network.subnet_ids
  cni_type                                                = var.cni_type
  vcn_id                                                  = local.vcn_id
  use_cluster_encryption                                  = var.use_cluster_encryption
  cluster_kms_key_id                                      = var.cluster_kms_key_id
  create_policies                                         = var.create_policies
  use_signed_images                                       = var.use_signed_images
  image_signing_keys                                      = var.image_signing_keys
  admission_controller_options                            = var.admission_controller_options

  # oke node pool parameters
  max_pods_per_node               = var.max_pods_per_node
  node_pools                      = var.node_pools
  node_pool_name_prefix           = var.node_pool_name_prefix
  node_pool_image_id              = var.node_pool_image_id
  node_pool_image_type            = var.node_pool_image_type
  node_pool_os                    = var.node_pool_os
  node_pool_os_version            = var.node_pool_os_version
  node_pool_timezone              = var.node_pool_timezone
  enable_pv_encryption_in_transit = var.enable_pv_encryption_in_transit
  use_node_pool_volume_encryption = var.use_node_pool_volume_encryption
  node_pool_volume_kms_key_id     = var.node_pool_volume_kms_key_id
  cloudinit_nodepool              = var.cloudinit_nodepool
  cloudinit_nodepool_common       = var.cloudinit_nodepool_common

  # oke load balancer parameters
  preferred_load_balancer = var.preferred_load_balancer

  # nsgs
  pod_nsgs = concat(module.network.pod_nsg_id)
  worker_nsgs = concat(var.worker_nsgs, [module.network.worker_nsg_id])

  freeform_tags = var.freeform_tags["oke"]

  depends_on = [
    module.network
  ]

  providers = {
    oci.home = oci.home
  }
}
*/
/*
module "streams" {
  source = "../../modules/oci-oke/streams"

  # general oci parameters
  compartment_id    = local.compartment.compartment_id
  stream_name       = local.stream_name
  stream_pool_name  = local.stream_pool
  #stream_pool_name  = join("", [local.stream_name, "POOL"])
  stream_partitions = var.stream_partitions
}


module "container_registry" {
  source = "../../modules/oci-oke/containerregistry"

  compartment_id          = var.container_registry_compartment_id
  container_registry_name = var.container_registry_name

}
*/
