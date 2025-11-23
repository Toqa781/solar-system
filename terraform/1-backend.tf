terraform {
  backend "s3" {
    bucket         = "solar-system-eks-tfstate-bucket-12345"
    key            = "./terraform.tfstate"
    dynamodb_table = "terraform-eks-state-locks"
    region         = "eu-central-1"
  }
}