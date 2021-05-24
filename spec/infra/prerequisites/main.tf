module "base_network" {
  source = "infrablocks/base-networking/aws"
  version = "3.0.0"

  region = var.region
  vpc_cidr = var.vpc_cidr
  availability_zones = var.availability_zones

  component = "${var.component}-net"
  deployment_identifier = var.deployment_identifier

  private_zone_id = var.private_zone_id
}

module "acm_certificate" {
  source = "infrablocks/acm-certificate/aws"
  version = "0.8.0"

  domain_name = var.domain_name
  domain_zone_id = var.public_zone_id
  subject_alternative_name_zone_id = var.public_zone_id
}
