# Terraform State Backend Configuration
#
# To use this S3 backend for storing Terraform state:
#
# 1. First, run: terraform init
#    This will initialize Terraform without a backend (using local state)
#
# 2. Create the state bucket and DynamoDB table manually or with Terraform
#    Make sure the bucket name and region match your setup
#
# 3. Uncomment the terraform block below
#
# 4. Then run: terraform init -migrate-state
#    This will migrate your local state to the S3 backend
#
# terraform {
#   backend "s3" {
#     bucket         = "portfolio-site-terraform-state-ap-south-1"
#     key            = "prod/terraform.tfstate"
#     region         = "ap-south-1"
#     encrypt        = true
#     dynamodb_table = "terraform-locks"
#   }
# }
