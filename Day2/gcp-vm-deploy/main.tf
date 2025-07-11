provider "google" {
  credentials = file("C:/Users/mural/Documents/gcp-terraform-key.json")
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}

module "vm_instance" {
  source         = "./modules/compute_instance"
  instance_name  = "my-instance1"
  machine_type   = "e2-medium"
  zone           = var.zone
  project_id     = var.project_id
  image_family   = "debian-11"
  image_project  = "debian-cloud"
}

module "gcs_bucket" {
  source        = "./modules/gcs_bucket"
  bucket_name   = "murali-test-devops2"
  location      = var.region
  storage_class = "STANDARD"
}
