variable "project_id" {
  type        = string
  description = "Google project ID"
  default     = "playground-sugi"
}

variable "region" {
  type        = string
  description = "Google project region"
  default     = "asia-southeast1"
}

variable "zone" {
  type        = string
  description = "The zone in which the dataflow job will be deployed"
  default     = "asia-southeast1-a"
}

/*
variable "service_account_email" {
  type        = string
  description = "The Service Account email used to create the job."
}
*/

variable "vpc_network" {
  type        = string
  description = "The VPC network that used by resources."
  default     = "vpc-spoke-test"
}

variable "subnet" {
  type        = string
  description = "The VPC network that used by resources."
  default     = "https://www.googleapis.com/compute/v1/projects/playground-sugi/regions/asia-southeast1/subnetworks/sb-spoke-test-sg"
}

variable "force_destroy" {
  type        = bool
  description = "When deleting a bucket, this boolean option will delete all contained objects. If you try to delete a bucket that contains objects, Terraform will fail that run."
  default     = false
}

variable "gcs_bucket_name" {
  type        = string
  description = "Google Cloud Storage bucket name"
  default     = "sugi-terraform-bucket"
}

variable "gcs_bucket_temp" {
  type        = string
  description = "Google Cloud Storage bucket name"
  default     = "gs://sugi-df-temp/temp3/"
}

variable "dataflow_template_source" {
  type        = string
  description = "Google Dataflow template source"
  default     = "gs://dataflow-templates-asia-southeast1/latest/Word_Count"
}