/* Create a Boundary target with the host set assigned. Specify the egress and/or ingress worker
you wish to used, based on the filters. The names for the workers are specified as tags within
the pki-worker.tf configuration file for the workers.
*/
resource "boundary_target" "aws_linux_private" {
  type                     = "tcp"
  name                     = "aws-private-linux"
  description              = "AWS Linux Private Target"
  egress_worker_filter     = " \"sm-egress-downstream-worker1\" in \"/tags/type\" "
  ingress_worker_filter    = " \"sm-ingress-upstream-worker1\" in \"/tags/type\" "
  scope_id                 = boundary_scope.project.id
  session_connection_limit = -1
  default_port             = 22
  host_source_ids = [
    boundary_host_set_static.aws-linux-machines.id
  ]
}

/* Create a Boundary target with the host set assigned. Specify the egress and/or ingress worker
you wish to used, based on the filters. The names for the workers are specified as tags within
the pki-worker.tf configuration file for the workers.
*/
resource "boundary_target" "aws" {
  type                     = "tcp"
  name                     = "aws-ec2"
  description              = "AWS EC2 Targets"
  egress_worker_filter     = " \"sm-worker1\" in \"/tags/type\" "
  scope_id                 = boundary_scope.project.id
  session_connection_limit = -1
  default_port             = 22
  host_source_ids = [
    boundary_host_set_plugin.aws-db.id,
    boundary_host_set_plugin.aws-dev.id,
    boundary_host_set_plugin.aws-prod.id,
  ]
}
