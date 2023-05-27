resource "random_string" "rand" {
    length  = "5"
    lower   = true
    upper   = false
    numeric = true
    special = false
}

locals {
    resource_prefix_unclean = "${var.location_short}-${var.project_short}-${var.environment}-${random_string.rand.result}"
    resource_prefix = lower(local.resource_prefix_unclean)
    tags = tomap({
        "project"   = var.project
    })
}