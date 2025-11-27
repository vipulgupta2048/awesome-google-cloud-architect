
[[Terraform]]


resource "google_compute_instance" "tf-instance-1" {

name = "tf-instance-1"

machine_type = "e2-standard-2"

zone = var.zone

  

boot_disk {

initialize_params {

image = "debian-cloud/debian-11"

}

}

  

network_interface {

network = "tf-vpc-980709"

subnetwork = "subnet-02"

access_config {

// Ephemeral IP

}

}

  

metadata_startup_script = <<-EOT

#!/bin/bash

EOT

  

allow_stopping_for_update = true

}

  

resource "google_compute_instance" "tf-instance-2" {

name = "tf-instance-2"

machine_type = "e2-standard-2"

zone = var.zone

  

boot_disk {

initialize_params {

image = "debian-cloud/debian-11"

}

}

  

network_interface {

network = "tf-vpc-980709"

subnetwork = "subnet-02"

access_config {

// Ephemeral IP

}

}

  

metadata_startup_script = <<-EOT

#!/bin/bash

EOT

  

allow_stopping_for_update = true

}









## Storage 


resource "google_storage_bucket" "tf-bucket-665555" {

name = "tf-bucket-665555"

location = "US"

force_destroy = true

uniform_bucket_level_access = true

}






# Root module - main configuration

  

terraform {

required_providers {

google = {

source = "hashicorp/google"

}

}

backend "gcs" {

bucket = "tf-bucket-665555"

prefix = "terraform/state"

}

}

  

provider "google" {

project = var.project_id

region = var.region

zone = var.zone

}

  

resource "google_compute_firewall" "tf-firewall" {

name = "tf-firewall"

network = "tf-vpc-980709"

  

allow {

protocol = "tcp"

ports = ["80"]

}

  

source_ranges = ["0.0.0.0/0"]

}

  
  

module "network" {

source = "terraform-google-modules/network/google"

version = "10.0.0"

  

project_id = var.project_id

network_name = "tf-vpc-980709"

routing_mode = "GLOBAL"

  

subnets = [

{

subnet_name = "subnet-01"

subnet_ip = "10.10.10.0/24"

subnet_region = "europe-west4"

},

{

subnet_name = "subnet-02"

subnet_ip = "10.10.20.0/24"

subnet_region = "europe-west4"

},

]

}

  
  

module "instances" {

source = "./modules/instances"

zone = var.zone

}

  

module "storage" {

source = "./modules/storage"

}





# Root module - variable definitions

  

variable "region" {

description = "The Google Cloud region to deploy resources in."

type = string

default = "europe-west4"

}

  

variable "zone" {

description = "The Google Cloud zone to deploy resources in."

type = string

default = "europe-west4-a"

}

  

variable "project_id" {

description = "The Google Cloud Project ID."

type = string

default = "qwiklabs-gcp-03-c07e2a0f3d97" # Replace with your actual Google Cloud Project ID

}

  
  
  

# Root module - variable definitions