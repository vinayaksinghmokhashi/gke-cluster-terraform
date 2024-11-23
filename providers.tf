terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.18.0"
    }
  }
}
provider "google" {
  project     = "infra-jet-435806-n3"
  region      = "asia-south-1"
  credentials = "./keys.json"
}
