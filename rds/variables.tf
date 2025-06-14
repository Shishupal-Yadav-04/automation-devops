
variable "db_username" {}
variable "db_password" {
    sensitive = true
}
variable "private_subnets_ids" {
  type = list(string)
}

variable "db_sg_ids" {
    type = list(string)
}

variable "tags" {
  type = map(string)
}

variable "db_identifier" {
  description = "The name of the RDS instance"
  type        = string
}

