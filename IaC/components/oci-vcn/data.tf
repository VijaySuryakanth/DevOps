# statements to fetch required data from OCI

data "oci_core_vcn" "test_vcn" {
    vcn_id = module.vcn.vcn_id
}


data "oci_core_services" "all_oci_services" {
  filter {
    name   = "name"
    values = ["All .* Services In Oracle Services Network"]
    regex  = true
  }
  count = var.create_service_gateway == true ? 1 : 0
}

output "service_gateway" {
  value = data.oci_core_services.all_oci_services 
}