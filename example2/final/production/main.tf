/**
 * Web Module Production
 */

provider "aws" {
  region  = var.region_name
  version = "~> 2.4"
}

module "production_web" {
  source = "../modules/web_module"

  ami_id              = var.ami_id
  bucket_prefix       = "terraform-nerd-bucket-production"
  dynamodb_table_name = "terraform-nerd-table-production"
  key_name            = var.key_name
  my_local_ip         = var.my_local_ip
  region_name         = var.region_name
  type_instance       = var.instance_type
  instance_profile    = "s3_dynamo_instance_profile"
  name_prefix         = "Production"
}
