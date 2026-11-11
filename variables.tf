variable "aws_region" {
  description = "AWS deployment region"
  type        = string
  default     = "us-east-1"
}

variable "admin_cidr" {
  description = "my public IP address in CIDR notation"
  type        = string
}

variable "db_username" {
  description = "RDS master username"
  type        = string
  default     = "appadmin"
}

variable "db_password" {
  description = "RDS master password"
  type        = string
  sensitive   = true
}

variable "ec2_key_name" {
  description = "Existing EC2 key pair name"
  type        = string
  default     = null
}