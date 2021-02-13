<<<<<<< HEAD
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.27.0"
    }
  }
}

provider "aws" {
  # Configuration options
  profile = "default"
  region  = "us-east-1"
}

# This is our aws budget

resource "aws_budgets_budget" "budget" {
  name              = var.budget_name
  budget_type       = "COST"
  limit_amount      = "1000"
  limit_unit        = "USD"
  time_period_end   = "2087-06-15_00:00"
  time_period_start = "2020-02-12_00:00"
  time_unit         = "MONTHLY"

  cost_filters = {
    Service = "Amazon Elastic Compute Cloud - Compute"
  }

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 100
    threshold_type             = "PERCENTAGE"
    notification_type          = "FORECASTED"
    subscriber_email_addresses = ["omoyeoziegbe@gmail.com"]
  }
}

# This is our EC2 resource
resource "aws_instance" "web" {
  ami           = var.ami_id
  count         = var.instance_count
  instance_type = var.instance_type

tags = {
    Name = var.environment
  }
}


#This is our s3 bucket
resource "aws_s3_bucket" "bucket" {
  bucket = var.asset_bucket_name
  acl    = "private"

  tags = {
     Environment = var.environment
  }
}  

  

output "server_ip" {
    value = aws_instance.web.*.public_dns
=======
provider "aws"{
region = "us-east-1"
}

resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"
>>>>>>> 4b1879f8abc85090cca268597ec5839a9373da18
}
