terraform {
  required_version = ">= 0.12.6"
  required_providers {
    oci = {
		source  = "oracle/oci"
		version = ">= 4.0.0"
    }
  }
}

provider oci {
	region = var.region
}


