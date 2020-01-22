/*
 * Web Module Production
 */

provider "aws" {
  region  = var.region_name
  version = "~> 2.4"
}

module "production_web" {
  source = "../modules/web_module"

  ami_id              = "ami-00068cd7555f543d5"
  bucket_prefix       = "terraform-nerd-bucket-production"
  dynamodb_table_name = "terraform-nerd-table-production"
  key_name            = "terraform_nerd"
  my_local_ip         = var.my_local_ip
  region_name         = var.region_name
  type_instance       = "t3.micro"
  web_servers_number  = 2
}