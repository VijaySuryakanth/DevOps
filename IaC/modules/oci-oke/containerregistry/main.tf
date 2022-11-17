
resource "oci_artifacts_container_repository" "test_container_repository" {
    #Required
    compartment_id = var.compartment_id
    display_name = var.container_registry_name

    #Optional
    is_public = false
}