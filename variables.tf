variable "project_id" {
  description = "The ID of the project in which the dashboard will be created."
  type        = string
  default     = "qwiklabs-gcp-03-9a5c79e9167a"
}

variable "gke_pod_dashboard_json_filename" {
  description = "Json file having Dashboard & Charts data in JSON format"
  type        = string
  default = "dashboards/gke-pod.json"
}

variable "gke_cluster_dashboard_json_filename" {
  description = "Json file having Dashboard & Charts data in JSON format"
  type        = string
  default = "dashboards/gke-cluster.json"
}

variable "spanner_dashboard_json_filename" {
  description = "Json file having Dashboard & Charts data in JSON format"
  type        = string
  default = "dashboards/spanner.json"
}
