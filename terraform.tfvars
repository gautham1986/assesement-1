# =============================================================================
# STEP 4b — terraform.tfvars
# The actual values for the variables declared in variables.tf.
#
# Fill in: one line per variable → VARIABLE_NAME = "value"
#
# If any value is a secret, do NOT commit this file to git.
# =============================================================================

region      = "eu-north-1"
project     = "assessment-1"
environment = "dev"
vpc_cidr              = "10.0.0.0/16"
frontend_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
backend_subnet_cidrs  = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]
database_subnet_cidrs = ["10.0.21.0/24", "10.0.22.0/24", "10.0.23.0/24"]
instance_type            = "t3.micro"
bootstrap_with_user_data = true