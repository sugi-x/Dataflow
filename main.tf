/**
 * Copyright 2019 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


provider "google" {
  region = var.region
}

resource "random_id" "random_suffix" {
  byte_length = 4
}

resource "google_dataflow_job" "dataflow_job" {
  project                = var.project_id
  region                 = var.region
  zone                   = var.zone
  name                   = "dataflow-terraform-1"
  on_delete              = "cancel"
  max_workers            = 1
  template_gcs_path      = var.dataflow_template_source
  temp_gcs_location      = var.gcs_bucket_temp
  //service_account_email  = var.service_account_email
  network                = var.vpc_network
  subnetwork             = var.subnet
  machine_type           = "n1-standard-1"
  //ip_configuration       = var.ip_configuration
  //additional_experiments = var.additional_experiments
  //kms_key_name           = var.kms_key_name
  //labels                 = var.labels
  parameters             = {
    inputFile = "gs://dataflow-samples/shakespeare/kinglear.txt"
    output    = "gs://sugi-df-output"
  }
}