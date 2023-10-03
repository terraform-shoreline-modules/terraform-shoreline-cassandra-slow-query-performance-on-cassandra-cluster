resource "shoreline_notebook" "slow_query_performance_on_cassandra_cluster" {
  name       = "slow_query_performance_on_cassandra_cluster"
  data       = file("${path.module}/data/slow_query_performance_on_cassandra_cluster.json")
  depends_on = [shoreline_action.invoke_increase_configuration]
}

resource "shoreline_file" "increase_configuration" {
  name             = "increase_configuration"
  input_file       = "${path.module}/data/increase_configuration.sh"
  md5              = filemd5("${path.module}/data/increase_configuration.sh")
  description      = "Check the Cassandra database configuration and ensure that it is properly optimized for the workload it handles. For instance, you may need to increase the size of the read/write buffers, cache, and threads."
  destination_path = "/agent/scripts/increase_configuration.sh"
  resource_query   = "host"
  enabled          = true
}

resource "shoreline_action" "invoke_increase_configuration" {
  name        = "invoke_increase_configuration"
  description = "Check the Cassandra database configuration and ensure that it is properly optimized for the workload it handles. For instance, you may need to increase the size of the read/write buffers, cache, and threads."
  command     = "`chmod +x /agent/scripts/increase_configuration.sh && /agent/scripts/increase_configuration.sh`"
  params      = ["PATH_TO_CONFIG_FILE"]
  file_deps   = ["increase_configuration"]
  enabled     = true
  depends_on  = [shoreline_file.increase_configuration]
}

