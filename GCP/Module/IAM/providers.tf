provider "google" {
  credentials = file("./prathmesh-iam-67e08d0c1141.json")
  project     = "prathmesh-iam"
  region      = "us-central1"
}
