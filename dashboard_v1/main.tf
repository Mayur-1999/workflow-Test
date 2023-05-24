/*
resource "google_monitoring_dashboard" "gke_pod_dashboard" {
  project        = var.project_id
  dashboard_json = file(var.gke_pod_dashboard_json_filename)
}

resource "google_monitoring_dashboard" "gke_cluster_dashboard" {
  project        = var.project_id
  dashboard_json = file(var.gke_cluster_dashboard_json_filename)
}

resource "google_monitoring_dashboard" "spanner_dashboard" {
  project        = var.project_id
  dashboard_json = file(var.spanner_dashboard_json_filename)
}
*/
module "gke_pod_dashboard" {
  source                  = "./dashboards"
  dashboard_json_filename = file(var.gke_pod_dashboard_json_filename)
  #project_id              = var.project_id
}

module "gke_cluster_dashboard" {
  source                  = "./dashboards"
  dashboard_json_filename = file(var.gke_cluster_dashboard_json_filename)
  #project_id              = var.project_id
}

module "spanner_dashboard" {
  source                  = "./dashboards"
  dashboard_json_filename = file(var.spanner_dashboard_json_filename)
  #project_id              = var.project_id
}