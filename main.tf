resource "google_container_cluster" "terraform-cluster" {
  name     = "terraform-gke-cluster"
  location = "asia-south1"

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1
}

resource "google_container_node_pool" "terraform-cluster_preemptible_nodes" {
  name       = "terraform-pool"
  location   = "asia-south1-a"
  cluster    = google_container_cluster.terraform-cluster.name
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "e2-small"
    disk_size_gb  = 20
    disk_type     = "pd-standard"

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
  }
}