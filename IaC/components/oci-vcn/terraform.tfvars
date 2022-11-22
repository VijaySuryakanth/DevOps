# OCI Authentication details
region = "eu-marseille-1"

tenancy_id      = "ocid1.tenancy.oc1..aaaaaaaaxn3r3dh3lh5n5hyo6tkbtmwjvr4wzlahs3u76c4enhckxhy4kpaa"
compartment_id = "ocid1.compartment.oc1..aaaaaaaawrvaz3qenxkroaq6zxnqfndsqvm4nylcxlnhpyp7mrbbo2pzhboa" 
label_prefix = "none"

vcn_name = "demo-vcn"
vcn_dns_label = "demovcn"
vcn_cidr_block = "10.14.0.0/16"

internet_gateway_display_name = "ig"
create_internet_gateway = true

nat_gateway_display_name = "nat"
create_nat_gateway = true

service_gateway_display_name = "sg"
create_service_gateway = true


nat_gateway_public_ip_id = "none"

lockdown_default_seclist = true

internet_gateway_route_rules = [
/*   {
     destination       = "192.168.0.0/16" # Route Rule Destination CIDR
     destination_type  = "CIDR_BLOCK"     # only CIDR_BLOCK is supported at the moment
     network_entity_id = "drg"            # for internet_gateway_route_rules input variable, you can use special strings "drg", "internet_gateway" or pass a valid OCID using string or any Named Values
     description       = "Terraformed - User added Routing Rule: To drg provided to this module. drg_id, if available, is automatically retrieved with keyword drg"
   },*/
]

nat_gateway_route_rules = [
/*   {
     destination       = "192.168.0.0/16" # Route Rule Destination CIDR
     destination_type  = "CIDR_BLOCK"     # only CIDR_BLOCK is supported at the moment
     network_entity_id = "drg"            # for nat_gateway_route_rules input variable, you can use special strings "drg", "nat_gateway" or pass a valid OCID using string or any Named Values
     description       = "Terraformed - User added Routing Rule: To drg provided to this module. drg_id, if available, is automatically retrieved with keyword drg"
  }, */
]

