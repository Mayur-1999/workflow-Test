module "vpc" {
  source                  = "./modules/vpc"
  project_id              = var.project_id
  network_name            = test-vpc
  auto_create_subnetworks = false
}

/*
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
*/