provider "tencentcloud" {
  region = "ap-singapore"
}

variable "availability_zone" {
  default = "ap-singapore-1"
}

variable "vpc" {
  default = "vpc-s0g57gc3"
}

variable "subnet" {
  default = "subnet-j9mrp52e"
}

variable "default_instance_type" {
  default = "S3.SMALL1"
}

variable "scale_instance_type" {
  default = "S3.SMALL1"
}

