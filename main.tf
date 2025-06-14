resource "aws_security_group" "rds_sg" {
  name        = "rds_sg"
  description = "Allow DB traffic"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Project     = "awsproj"
    Environment = "dev"
  }
}



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




module "rds" {
  source               = "./rds"
  db_identifier        = var.db_identifier
  db_username          = var.db_username
  db_password          = var.db_password
  private_subnets_ids  = module.vpc.private_subnet_ids
  db_sg_ids            = [aws_security_group.rds_sg.id]

  tags = {
    Project     = "awsproj"
    Environment = "dev"
  }
}
