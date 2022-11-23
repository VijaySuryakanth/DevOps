# Copyright 2017, 2021 Oracle Corporation and/or affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

# Identity and access parameters
home_region     = "eu-frankfurt-1"
region          = "eu-marseille-1"

tenancy_id      = "ocid1.tenancy.oc1..aaaaaaaaxn3r3dh3lh5n5hyo6tkbtmwjvr4wzlahs3u76c4enhckxhy4kpaa"

# general oci parameters
env_param = {
  dev = {
    compartment_id          = "ocid1.compartment.oc1..aaaaaaaawrvaz3qenxkroaq6zxnqfndsqvm4nylcxlnhpyp7mrbbo2pzhboa"
    network_compartment_id  = "ocid1.compartment.oc1..aaaaaaaawrvaz3qenxkroaq6zxnqfndsqvm4nylcxlnhpyp7mrbbo2pzhboa"
    ssh_public_key_path     = "keys/dev/id_rsa.pub" 
    vcn_id                  = "ocid1.vcn.oc1.eu-marseille-1.amaaaaaazjgvoqya5vis3kjmfv3nin7w4xivto5zrcylcmv4vinc3ml4ly6a"
    ig_rt_id                = "ocid1.routetable.oc1.eu-marseille-1.aaaaaaaagm2qrar4bps6gccw2axygigxpse2525bjna52yg5bbwdzuzk5fna"
    nat_rt_id               = "ocid1.routetable.oc1.eu-marseille-1.aaaaaaaa7yqb4jzam6mzvqyhd3xfsrw6ag4zofvbcsn2odn3oggliyquc3za"
    cluster_name            = "k8scls-dev"
  },
  uat = {
    compartment_id          = ""
    network_compartment_id  = ""
    ssh_public_key_path     = "" 
    vcn_id                  = ""
    ig_rt_id                = ""
    nat_rt_id               = ""
    cluster_name            = "k8scls-uat"
  }
}

subnets = {
  dev = {  
    cp       = "10.95.0.0/26"
    pub_lb   = "10.95.0.64/26"
    workers  = "10.95.0.128/26"
    vcn_cidr = "10.95.0.0/24"
  }
}

cni_type                     = "flannel"
control_plane_type           = "private"
control_plane_allowed_cidrs  = ["10.0.0.0/16"]
control_plane_nsgs           = []
dashboard_enabled            = false
kubernetes_version           = "v1.24.1"
pods_cidr                    = "10.244.0.0/16"
services_cidr                = "10.96.0.0/16"
admission_controller_options = {
  PodSecurityPolicy = false
}
allow_node_port_access       = false
allow_pod_internet_access    = false
allow_worker_internet_access = true
allow_worker_ssh_access      = true
## oke cluster kms integration
use_cluster_encryption  = false
cluster_kms_key_id      = ""
create_policies         = false

## oke cluster container image policy and keys
use_signed_images = false

# node pools
check_node_active = "all"
enable_pv_encryption_in_transit = false
node_pools = {
  #apppool = { shape = "VM.Standard2.4", ocpus = 4, memory = 32, node_pool_size = 2, boot_volume_size = 150, label = { pool = "apppool" } }
}

node_pool_image_id    = "none"
node_pool_image_type  = "oke"
#node_pool_image_type  = "custom"
node_pool_name_prefix = "np"
node_pool_os          = "Oracle Linux"
node_pool_os_version  = "8.6"
worker_nsgs           = []
worker_type           = "private"
#node_pool_volume_kms_key_id = "ocid1.key.oc1.me-jeddah-1.dfqz3zocaahaq.abvgkljrjdec2c6yvpwjjiqjydjbqyejbqhquoa72z2uzr53njxqmcnyi7oa"

#cloudinit_nodepool_common = "/tmp/commoncloudinit.sh"
#cloudinit_nodepool_common = "scripts/cloudinit_oci.sh"
#cloudinit_nodepool        = {
  #np1 = "/tmp/np1cloudinit.sh"
  #np3 = "/tmp/np3cloudinit.sh"
#}

node_pool_timezone        = "Etc/UTC"

# upgrade of existing node pools
upgrade_nodepool        = false
node_pools_to_drain     = ["apppool"]
nodepool_upgrade_method = "out_of_place"

# oke load balancers
enable_waf                   = false
load_balancers               = "public"
preferred_load_balancer      = "public"

# placeholder variable for debugging scripts. To be implemented in future
debug_mode = false