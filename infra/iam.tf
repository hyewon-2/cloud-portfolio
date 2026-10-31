data "aws_iam_policy_document" "ecs_tasks_assume" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

# 실행 역할(execution role): ECS가 태스크를 "띄울 때" 쓰는 권한.
# ECR에서 이미지를 받고, CloudWatch Logs에 로그 스트림을 만드는 데 쓴다.
resource "aws_iam_role" "task_execution" {
  name               = "${var.project}-task-execution"
  assume_role_policy = data.aws_iam_policy_document.ecs_tasks_assume.json
}

resource "aws_iam_role_policy_attachment" "task_execution" {
  role       = aws_iam_role.task_execution.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

# 태스크 역할(task role): 컨테이너 안의 "앱 코드"가 AWS API를 호출할 때 쓰는 권한.
# 지금은 앱이 AWS를 호출하지 않아서 비어 있다. DB 단계에서 Secrets Manager 권한을 붙인다.
resource "aws_iam_role" "task" {
  name               = "${var.project}-task"
  assume_role_policy = data.aws_iam_policy_document.ecs_tasks_assume.json
}
