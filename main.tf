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
  
module "notification-channel" {
  source                  = "./modules/notification-channel"
  #project_id              = var.project_id
}

module "gke" {
  source                  = "./modules/gke"
  CLUSTER_NAME            = "sre"
  COE_team = module.notification-channel
  CLUSTER_LOCATION            = "us-central1"
  #project_id              = var.project_id
}

module "vm" {
  source                  = "./modules/VM"
  COE_team = module.notification-channel
  #project_id              = var.project_id
}

module "spanner" {
  source                  = "./modules/spanner"
  COE_team = module.notification-channel
  #SPANNER_NAME            = ""
  #project_id              = var.project_id
}

module "prometheus" {
  source                  = "./modules/prometheus-alert"
  COE_team = module.notification-channel
  #project_id              = var.project_id
}
