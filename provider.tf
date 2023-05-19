terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}
provider "google" {
  project = "qwiklabs-gcp-02-3b220788b71a"
  region  = "us-central1"

}
