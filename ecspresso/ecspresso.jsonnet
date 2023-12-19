{
    region: "{{ must_env `AWS_REGION` }}",
    cluster: "{{ must_env `ECS_CLUSTER` }}",
    task_definition: "ecs-task-def.jsonnet",
    timeout: "10m0s",
}