# --------------------------------------------------------------------------------------------------------
# ECS Task Role
# --------------------------------------------------------------------------------------------------------
resource "aws_iam_role" "ecs_task_role" {
  name = var.role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = { Service = "ecs-tasks.amazonaws.com" },
      Action = "sts:AssumeRole"
    }]
  })

  tags = var.tags
}

# --------------------------------------------------------------------------------------------------------
# Attach standard ECS execution policy
# --------------------------------------------------------------------------------------------------------
resource "aws_iam_role_policy_attachment" "ecs_execution" {
  role       = aws_iam_role.ecs_task_role.name
  policy_arn = var.execution_policy_arn
}

# --------------------------------------------------------------------------------------------------------
# Custom policy for S3, Secrets Manager, CloudWatch, ECR
# --------------------------------------------------------------------------------------------------------
resource "aws_iam_policy" "ecs_task_policy" {
  name        = var.custom_policy_name
  description = var.custom_policy_description

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:ListBucket"
        ],
        Resource = [
          "arn:aws:s3:::${var.s3_bucket_name}",
          "arn:aws:s3:::${var.s3_bucket_name}/*"
        ]
      },
      {
        Effect   = "Allow",
        Action   = [
          "secretsmanager:GetSecretValue",
          "secretsmanager:DescribeSecret"
        ],
        Resource = "*"
      },
      {
        Effect   = "Allow",
        Action   = [
          "ecr:GetAuthorizationToken",
          "ecr:BatchGetImage",
          "ecr:BatchCheckLayerAvailability",
          "ecr:GetDownloadUrlForLayer"
        ],
        Resource = "*"
      },
      {
        Effect   = "Allow",
        Action   = [
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "logs:DescribeLogStreams"
        ],
        Resource = "*"
      }
    ]
  })
}

# --------------------------------------------------------------------------------------------------------
# Attach custom policy to role
# --------------------------------------------------------------------------------------------------------
resource "aws_iam_role_policy_attachment" "ecs_task_custom_attach" {
  role       = aws_iam_role.ecs_task_role.name
  policy_arn = aws_iam_policy.ecs_task_policy.arn
}
