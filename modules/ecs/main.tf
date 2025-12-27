# --------------------------------------------------------------------------------------------------------
# ECS Cluster
# --------------------------------------------------------------------------------------------------------
resource "aws_ecs_cluster" "letschat" {
  name = var.cluster_name
}

# --------------------------------------------------------------------------------------------------------
# Cloud watch for log group
# --------------------------------------------------------------------------------------------------------
resource "aws_cloudwatch_log_group" "letschat_backend" {
  name              = var.log_group_name
  retention_in_days = var.log_retention
}

# --------------------------------------------------------------------------------------------------------
# ECS Task for backend
# --------------------------------------------------------------------------------------------------------
resource "aws_ecs_task_definition" "letschat_backend" {
  family                   = var.ecs_family_name
  network_mode             = var.network_mode
  requires_compatibilities = var.requires_compatibilities
  cpu                      = var.cpu
  memory                   = var.memory

  execution_role_arn = var.execution_role_arn
  task_role_arn      = var.task_role_arn

  runtime_platform {
    operating_system_family = var.operating_system_family
    cpu_architecture        = var.cpu_architecture
  }

  container_definitions = jsonencode([{
    name      = var.ecs_family_name
    image     = var.ecs_image
    essential = true

    portMappings = [{
      containerPort = var.ecs_container_port
      hostPort      = var.ecs_container_port
    }]

    environment = [
      { name = "NODE_ENV", value = var.ecs_node_env },
      { name = "PORT", value = tostring(var.ecs_container_port) }
    ]

    secrets = [
      for s in var.secret_keys : {
        name      = s
        valueFrom = "${var.secret_arn}:${s}::"
      }
    ]

    healthCheck = {
      command     = var.healthcheck_command
      interval    = var.healthcheck_interval
      timeout     = var.healthcheck_timeout
      retries     = var.healthcheck_retries
      startPeriod = var.healthcheck_start_period
    }

    logConfiguration = {
      logDriver = "awslogs"
      options = {
        "awslogs-group"         = var.log_group_name
        "awslogs-region"        = var.aws_region
        "awslogs-stream-prefix" = "ecs"
      }
    }
  }])
}
