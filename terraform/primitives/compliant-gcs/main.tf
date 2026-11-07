terraform {
  required_version = ">= 1.9"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = "project-84cfdbe4-c470-4253-b35"
  region  = "us-central1"
}

module "data_bucket" {
  source = "../../modules/compliant-gcs-bucket"

  gcp_project        = "project-84cfdbe4-c470-4253-b35"
  project_label      = "cgep-lab"
  environment        = "dev"
  retention_days     = 30
  bucket_name_suffix = "dev-data-km-84cfdbe4"
}

output "attestation" {
  value = module.data_bucket.compliance_attestation
}

output "bucket_url" {
  value = module.data_bucket.bucket_url
}

output "kms_key_id" {
  value = module.data_bucket.kms_key_id
}
