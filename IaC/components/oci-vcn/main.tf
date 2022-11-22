#OCI resources
#Latest comments on oci vcn resources tf script


module "vcn" {
    source = "../../modules/oci-network/vcn" 
    region = var.region
    
    vcn_name                        = var.vcn_name
    vcn_dns_label                   = var.vcn_dns_label
    vcn_cidr_block                  = var.vcn_cidr_block
    internet_gateway_display_name 	= var.internet_gateway_display_name 	
    create_internet_gateway 		    = var.create_internet_gateway                                      
    nat_gateway_display_name 		    = var.nat_gateway_display_name 		
    create_nat_gateway 				      = var.create_nat_gateway 		                                      
    service_gateway_display_name 	  = var.service_gateway_display_name 	
    create_service_gateway 			    = var.create_service_gateway 

}
