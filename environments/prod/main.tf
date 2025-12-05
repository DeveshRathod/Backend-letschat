################################################################################################################
# VPC Module
################################################################################################################
module "vpc_module" {
  source = "../../modules/vpc"

  vpc_name             = var.vpc_name
  cidr_for_vpc         = var.vpc_cidr
  aws_region           = var.aws_region

  private_subnets      = var.private_subnets
  public_subnets       = var.public_subnets
  nat_attached_subnets = var.nat_attached_subnets

  nat_attached = var.nat_attached
  ig_attached  = var.ig_attached

  private_subnets_cidr = var.private_subnets_cidr
  public_subnets_cidr  = var.public_subnets_cidr
  nat_subnets_cidr     = var.nat_subnets_cidr
}

################################################################################################################
# SG Module
################################################################################################################
module "sg_module" {
  source = "../../modules/sg"

  sg_name    = var.sg_name
  vpc_id     = module.vpc_module.vpc_id
  aws_region = var.aws_region
  sg_ports   = var.sg_ports
}

################################################################################################################
# SM Module
################################################################################################################
module "sm_module" {
  source = "../../modules/sm"
  
  aws_region = var.aws_region
  secret_description = var.secret_description
  secret_for_sm = var.secret_for_sm
  secret_name = var.secret_name
  secret_tags = var.secret_tags
}

################################################################################################################
# IAM Module
################################################################################################################
module "iam_module" {
  source = "../../modules/iam"
  aws_region = var.aws_region
  custom_policy_description = var.custom_policy_description
  custom_policy_name = var.custom_policy_name
  execution_policy_arn = var.execution_policy_arn
  role_name = var.role_name
  s3_bucket_name = var.s3_bucket_name
  tags = var.tags
}

################################################################################################################
# NS Module
################################################################################################################
module "ns_module" {
  source = "../../modules/ns"

  aws_region = var.aws_region
  namespace_description = var.namespace_description
  namespace_tags = var.namespace_tags
  namespace_name = var.namespace_name
  vpc_id = module.vpc_module.vpc_id
}

################################################################################################################
# Endpoints Module
################################################################################################################
module "endpoints_module" {
  source = "../../modules/endpoints"

  vpc_id              = module.vpc_module.vpc_id
  aws_region          = var.aws_region
  private_subnets     = module.vpc_module.nat_private_subnets_ids
  private_route_tables = module.vpc_module.all_private_route_table_ids
  security_group_id   = module.sg_module.sg_id

  enable_logs            = var.enable_logs
  enable_ecr_api         = var.enable_ecr_api
  enable_ecr_dkr         = var.enable_ecr_dkr
  enable_s3_gateway      = var.enable_s3_gateway
  enable_secretsmanager  = var.enable_secretsmanager

  endpoint_tags = var.endpoint_tags
}

################################################################################################################
# ECS Module
################################################################################################################
module "ecs_module" {
  source = "../../modules/ecs"  
  
  aws_region = var.aws_region

  cluster_name   = var.cluster_name
  log_group_name = var.log_group_name
  log_retention  = var.log_retention

  ecs_family_name    = var.ecs_family_name
  ecs_image          = var.ecs_image
  ecs_node_env       = var.ecs_node_env
  ecs_container_port = var.ecs_container_port

  cpu    = var.cpu
  memory = var.memory

  network_mode             = var.network_mode
  requires_compatibilities = var.requires_compatibilities
  operating_system_family  = var.operating_system_family
  cpu_architecture         = var.cpu_architecture

  execution_role_arn = module.iam_module.ecs_task_role_arn
  task_role_arn      = module.iam_module.ecs_task_role_arn

  secret_arn  = module.sm_module.secret_arn
  secret_keys = var.secret_keys

  healthcheck_command     = var.healthcheck_command
  healthcheck_interval    = var.healthcheck_interval
  healthcheck_timeout     = var.healthcheck_timeout
  healthcheck_retries     = var.healthcheck_retries
  healthcheck_start_period = var.healthcheck_start_period
}

################################################################################################################
# Service Module
################################################################################################################
module "service_module" {
  source = "../../modules/service"

  aws_region = var.aws_region

  service_name         = var.service_name
  cluster_arn          = module.ecs_module.ecs_cluster_arn
  cluster_name         =  module.ecs_module.ecs_cluster_name
  task_definition_arn  = module.ecs_module.ecs_task_definition_arn

  launch_type          = var.launch_type
  desired_count        = var.desired_count
  subnets              = module.vpc_module.nat_private_subnets_ids
  security_groups      = [module.sg_module.sg_id]
  assign_public_ip     = var.assign_public_ip

  namespace_id         = module.ns_module.aws_service_discovery_private_dns_namespace_id
  dns_record_type      = var.dns_record_type
  dns_ttl              = var.dns_ttl
  routing_policy       = var.routing_policy

  min_capacity         = var.min_capacity
  max_capacity         = var.max_capacity

  scalable_dimension   = var.scalable_dimension
  service_namespace    = var.service_namespace

  metric_type          = var.metric_type
  target_value         = var.target_value
  scale_in_cooldown    = var.scale_in_cooldown
  scale_out_cooldown   = var.scale_out_cooldown
}
