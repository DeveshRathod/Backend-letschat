# --------------------------------------------------------------------------------------------------------
# Service discovery
# --------------------------------------------------------------------------------------------------------
resource "aws_service_discovery_service" "this" {
  name = var.service_name

  dns_config {
    namespace_id = var.namespace_id

    dns_records {
      type = var.dns_record_type
      ttl  = var.dns_ttl
    }

    routing_policy = var.routing_policy
  }
}

# --------------------------------------------------------------------------------------------------------
# ECS Service 
# --------------------------------------------------------------------------------------------------------
resource "aws_ecs_service" "this" {
  name            = var.service_name
  cluster         = var.cluster_arn
  task_definition = var.task_definition_arn
  desired_count   = var.desired_count
  launch_type     = var.launch_type

  network_configuration {
    subnets          = var.subnets
    security_groups  = var.security_groups
    assign_public_ip = var.assign_public_ip
  }

  service_registries {
    registry_arn = aws_service_discovery_service.this.arn
  }
}

# --------------------------------------------------------------------------------------------------------
# Auto scaling for ecs service
# --------------------------------------------------------------------------------------------------------
resource "aws_appautoscaling_target" "this" {
  max_capacity       = var.max_capacity
  min_capacity       = var.min_capacity
  resource_id        = "service/${var.cluster_name}/${var.service_name}"
  scalable_dimension = var.scalable_dimension
  service_namespace  = var.service_namespace
  
}

# --------------------------------------------------------------------------------------------------------
# Auto scaling policy
# --------------------------------------------------------------------------------------------------------
resource "aws_appautoscaling_policy" "this" {
  name               = "${var.service_name}-scaling"
  service_namespace  = var.service_namespace
  resource_id        = aws_appautoscaling_target.this.resource_id
  scalable_dimension = aws_appautoscaling_target.this.scalable_dimension
  policy_type        = "TargetTrackingScaling"

  target_tracking_scaling_policy_configuration {
    target_value = var.target_value

    predefined_metric_specification {
      predefined_metric_type = var.metric_type
    }

    scale_in_cooldown  = var.scale_in_cooldown
    scale_out_cooldown = var.scale_out_cooldown
  }
}
