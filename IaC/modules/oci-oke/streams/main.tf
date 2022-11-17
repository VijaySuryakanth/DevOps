
# include all resources to create Stream Service and Stream Pool


resource "oci_streaming_stream_pool" "test_stream_pool" {
    #Required
    compartment_id  = var.compartment_id
    name            = var.stream_pool_name
}

resource "oci_streaming_stream" "test_stream" {
    #Required
    name        = var.stream_name
    partitions  = var.stream_partitions

    #Optional
    stream_pool_id = oci_streaming_stream_pool.test_stream_pool.id
}
