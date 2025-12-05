terraform {
  backend "s3" {
    bucket = "devesh11411"
    region = "ap-south-1"
    key = "letschat-backend/dev/terraform.tfstate"
  }
}