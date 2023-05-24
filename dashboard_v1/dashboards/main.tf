resource "google_monitoring_dashboard" "monitoring_dashboard" {
  project        = var.project_id
  dashboard_json = var.dashboard_json_filename
}
