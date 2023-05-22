
#resource "google_project_service" "monitoring" {
#  project = var.project_id
#  service = "monitoring.googleapis.com"
#}

#resource "google_monitoring_dashboard" "gke_pod_dashboard" {
#  project        = var.project_id
#  dashboard_json = file(var.gke_pod_dashboard_json_filename)
#}

#resource "google_monitoring_dashboard" "gke_cluster_dashboard" {
#  project        = var.project_id
#  dashboard_json = file(var.gke_cluster_dashboard_json_filename)
#}

resource "google_monitoring_dashboard" "spanner_dashboard" {
  project        = var.project_id
  dashboard_json = file(var.spanner_dashboard_json_filename)
}
