{
  "containerDefinitions": [
    {
      "essential": true,
      "image": "{{ must_env `AWS_ACCOUNT_ID` }}.dkr.ecr.{{ must_env `AWS_REGION` }}.amazonaws.com/test_ecs_batch_django:{{ must_env `IMAGE_TAG` }}",
      "logConfiguration": {
        "logDriver": "awslogs",
        "options": {
          "awslogs-group": "/ecs/test_batch",
          "awslogs-region": "{{ must_env `AWS_REGION` }}",
          "awslogs-stream-prefix": "test_batch_django"
        }
      },
      "name": "django",
      "portMappings": [
        {
          "appProtocol": "",
          "containerPort": 8000,
          "hostPort": 8000,
          "protocol": "tcp"
        }
      ]
    }
  ],
  "cpu": "256",
  "executionRoleArn": "arn:aws:iam::{{ must_env `AWS_ACCOUNT_ID` }}:role/ecsTaskExecutionRole",
  "family": "test_ecs_batch_task_definition",
  "ipcMode": "",
  "memory": "512",
  "networkMode": "awsvpc",
  "runtimePlatform": {
    "operatingSystemFamily": "LINUX",
    "cpuArchitecture": "ARM64"
  },
  "pidMode": "",
  "requiresCompatibilities": ["FARGATE"],
  "taskRoleArn": "arn:aws:iam::{{ must_env `AWS_ACCOUNT_ID` }}:role/ecsTaskExecutionRole"
}