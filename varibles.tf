#------------------------------------------#
# AWS Environment Values
#------------------------------------------#
variable "access_key" {
    description = "AWS account access key ID"
}

variable "secret_key" {
    description = "AWS account secret access key"
}

variable "region" {
  description = "EC2 Region for the VPC"
    default = "us-west-2"
}
variable "zone_id" {
  description = "zone id for the R53"
}
