local scheduleExpression = 'cron(0 0/5 * * ? *)';
local variables = [
  'command_a', 
  'command_b', 
  'command_c',
];
local generateRule(cmd) = {
  name: cmd,
  scheduleExpression: scheduleExpression,
  taskDefinition: 'test_ecs_batch_task_definition',
  containerOverrides: [
    {
      name: 'django',
      command: [
        'python',
        'manage.py',
        cmd,
      ],
    },
  ],
  platform_version: '1.4.0',
  launch_type: 'FARGATE',
  network_configuration: {
    aws_vpc_configuration: {
      subnets: ['{{ must_env `SUBNET_ID` }}'],
      security_groups: ['{{ must_env `SECURITY_GROUP_ID` }}'],
    },
  },
};
local generateRules = [generateRule(variable) for variable in variables];

{
region: '{{ must_env `AWS_REGION` }}',
cluster: "{{ must_env `ECS_CLUSTER` }}",
rules: generateRules,
}