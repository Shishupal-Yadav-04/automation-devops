module "vpc" {
  source          = "./vpc"
  region          = var.aws_region
  vpc_cidr        = "10.0.0.0/16"
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.101.0/24", "10.0.102.0/24"]

  tags = {
    Project     = "awsproj"
    Environment = "dev"
  }
}

module "iam_role" {
  source         = "./iam"
  role_name      = var.role_name
  aws_account_id = var.aws_account_id
  tags = {
    Project     = "awsproj"
    Environment = "dev"
  }
}

