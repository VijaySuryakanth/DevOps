data "oci_core_service_gateways" "test_service_gateways" {
    #Required
    compartment_id = var.compartment_id
    #vcn_id = oci_core_vcn.test_vcn.id
}

output "service_gateway" {
  value = data.oci_core_service_gateways.test_service_gateways 
}