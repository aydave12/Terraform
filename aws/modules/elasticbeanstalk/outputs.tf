#-----------------------------------------------------------------
# EB APP
#-----------------------------------------------------------------
output "elastic_beanstalk_application_id" {
  description = "ID for elastic_beanstalk_application"
  value       = element(concat(aws_elastic_beanstalk_application.elastic_beanstalk_application.*.id, [""]), 0)
}

output "elastic_beanstalk_application_name" {
  description = "Name for elastic_beanstalk_application"
  value       = element(concat(aws_elastic_beanstalk_application.elastic_beanstalk_application.*.name, [""]), 0)
}

output "elastic_beanstalk_application_arn" {
  description = "Name for elastic_beanstalk_application"
  value       = element(concat(aws_elastic_beanstalk_application.elastic_beanstalk_application.*.arn, [""]), 0)
}

#-----------------------------------------------------------------
# EB App version
#-----------------------------------------------------------------
output "elastic_beanstalk_application_version_name" {
  description = "The Application Version name."
  value       = element(concat(aws_elastic_beanstalk_application_version.elastic_beanstalk_application_version.*.name, [""]), 0)
}

output "elastic_beanstalk_application_version_arn" {
  description = "The ARN assigned by AWS for this Elastic Beanstalk Application."
  value       = element(concat(aws_elastic_beanstalk_application_version.elastic_beanstalk_application_version.*.arn, [""]), 0)
}

output "elastic_beanstalk_application_version_id" {
  description = "The ID assigned by AWS for this Elastic Beanstalk Application."
  value       = element(concat(aws_elastic_beanstalk_application_version.elastic_beanstalk_application_version.*.id, [""]), 0)
}

#-----------------------------------------------------------------
# EB ENV
#-----------------------------------------------------------------
output "elastic_beanstalk_environment_id" {
  description = "ID of the Elastic Beanstalk Environment."
  value       = element(concat(aws_elastic_beanstalk_environment.elastic_beanstalk_environment.*.id, [""]), 0)
}

output "elastic_beanstalk_environment_name" {
  description = "Name of the Elastic Beanstalk Environment."
  value       = element(concat(aws_elastic_beanstalk_environment.elastic_beanstalk_environment.*.name, [""]), 0)
}

output "elastic_beanstalk_environment_application" {
  description = "The Elastic Beanstalk Application specified for this environment."
  value       = element(concat(aws_elastic_beanstalk_environment.elastic_beanstalk_environment.*.application, [""]), 0)
}

output "elastic_beanstalk_environment_setting" {
  description = "Settings specifically set for this Environment."
  value       = aws_elastic_beanstalk_environment.elastic_beanstalk_environment.*.setting
}

output "elastic_beanstalk_environment_all_settings" {
  description = "List of all option settings configured in the Environment. These are a combination of default settings and their overrides from setting in the configuration."
  value       = aws_elastic_beanstalk_environment.elastic_beanstalk_environment.*.all_settings
}

output "elastic_beanstalk_environment_cname" {
  description = "Fully qualified DNS name for the Environment."
  value       = element(concat(aws_elastic_beanstalk_environment.elastic_beanstalk_environment.*.cname, [""]), 0)
}

output "elastic_beanstalk_environment_autoscaling_groups" {
  description = "The autoscaling groups used by this environment."
  value       = aws_elastic_beanstalk_environment.elastic_beanstalk_environment.*.autoscaling_groups
}

output "elastic_beanstalk_environment_instances" {
  description = "Instances used by this environment."
  value       = aws_elastic_beanstalk_environment.elastic_beanstalk_environment.*.instances
}

output "elastic_beanstalk_environment_launch_configurations" {
  description = "Launch configurations in use by this environment."
  value       = aws_elastic_beanstalk_environment.elastic_beanstalk_environment.*.launch_configurations
}

output "elastic_beanstalk_environment_load_balancers" {
  description = "Elastic load balancers in use by this environment."
  value       = aws_elastic_beanstalk_environment.elastic_beanstalk_environment.*.load_balancers
}

output "elastic_beanstalk_environment_queues" {
  description = "SQS queues in use by this environment."
  value       = aws_elastic_beanstalk_environment.elastic_beanstalk_environment.*.queues
}

output "elastic_beanstalk_environment_triggers" {
  description = "Autoscaling triggers in use by this environment."
  value       = aws_elastic_beanstalk_environment.elastic_beanstalk_environment.*.triggers
}

output "elastic_beanstalk_environment_description" {
  description = "Description of the Elastic Beanstalk Environment."
  value       = element(concat(aws_elastic_beanstalk_environment.elastic_beanstalk_environment.*.description, [""]), 0)
}

output "elastic_beanstalk_environment_tier" {
  description = "The environment tier specified."
  value       = element(concat(aws_elastic_beanstalk_environment.elastic_beanstalk_environment.*.tier, [""]), 0)
}

output "elastic_beanstalk_environment_endpoint_url" {
  description = "The URL to the Load Balancer for this Environment"
  value       = element(concat(aws_elastic_beanstalk_environment.elastic_beanstalk_environment.*.endpoint_url, [""]), 0)
}

#-----------------------------------------------------------------
# EB configuration template
#-----------------------------------------------------------------
output "elastic_beanstalk_configuration_template_name" {
  description = "Name for created config-template"
  value       = element(concat(aws_elastic_beanstalk_configuration_template.elastic_beanstalk_configuration_template.*.name, [""]), 0)
}
