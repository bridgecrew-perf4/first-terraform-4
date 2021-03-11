resource "google_container_cluster" "kubeclustername" {
  name    = "kube-cluster-name"
  project = "terra-project"
  region  = "asia-southeast1-c"
  cluster = "kube-cluster-name"
}
