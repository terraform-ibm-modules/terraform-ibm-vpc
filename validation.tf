locals {
  validate_address_prefix  = !var.auto_assign_address_prefix && anytrue([for location in var.locations : location.address_prefix == null]) ? tobool("`var.locations[*].address_prefix` can't be null when `var.auto_assign_address_prefix` is set to false") : false
  validate_existing_vpc_id = var.existing_vpc_id == null && var.create_vpc == false ? tobool("`var.existing_vpc_id ` is required when `var.create_vpc` is false") : false
}