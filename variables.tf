variable "ami_id" {
  type        = string
  description = "This is the ami ID for our region"
}


variable "instance_type" {
  type        = string
  description = "This is the variable that describes the size and class for our instances"

}

variable "environment" {
  type        = string
  description = " The environment for our ec2 instances"
}


variable "budget_name" {
  type = string
}

variable "instance_count" {
  type = number
}

variable "asset_bucket_name" {
  type = string
}
