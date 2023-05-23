# Configure the AWS VM hosts
variable "instances" {
  default = [
    "boundary-1-dev",
    "boundary-2-dev",
    "boundary-3-production",
    "boundary-4-production"
  ]
}

variable "vm_tags" {
  default = [
    { "Name" : "boundary-1-dev", "service-type" : "database", "application" : "dev" },
    { "Name" : "boundary-2-dev", "service-type" : "database", "application" : "dev" },
    { "Name" : "boundary-3-production", "service-type" : "database", "application" : "production" },
    { "Name" : "boundary-4-production", "service-type" : "database", "application" : "production" }
  ]
}