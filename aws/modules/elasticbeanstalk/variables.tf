#-----------------------------------------------------------
# Global or/and default variables
#-----------------------------------------------------------
variable "name" {
  description = "Name to be used on all resources as prefix"
  default     = "TEST"
}

variable "environment" {
  description = "Environment for service"
  default     = "STAGE"
}

variable "tags" {
  description = "Add additional tags"
  default     = {}
}

#-----------------------------------------------------------
# EB APP
#-----------------------------------------------------------
variable "enable_elastic_beanstalk_application" {
  description = "Enable to create elastic_beanstalk_application"
  default     = false
}

variable "elastic_beanstalk_application_name" {
  description = "The name of the application, must be unique within your account"
  default     = ""
}

variable "elastic_beanstalk_application_description" {
  description = "(Optional) Short description of the application"
  default     = ""
}

variable "elastic_beanstalk_application_appversion_lifecycle" {
  description = "Application version lifecycle (appversion_lifecycle) supports the following settings. Only one of either max_count or max_age_in_days can be provided"
  type        = list(object({}))
  default     = []
}

#-----------------------------------------------------------
# EB application version
#-----------------------------------------------------------
variable "enable_elastic_beanstalk_application_version" {
  description = "Enable creating beanstalk application version"
  default     = false
}

variable "elastic_beanstalk_application_version_name" {
  description = "A unique name for the this Application Version."
  default     = ""
}

variable "elastic_beanstalk_application_version_description" {
  description = "(Optional) Short description of the Application Version."
  default     = ""
}

variable "elastic_beanstalk_application_version_application" {
  description = "Name of the Beanstalk Application the version is associated with."
  default     = ""
}

variable "elastic_beanstalk_application_version_bucket" {
  description = "(Required) S3 bucket that contains the Application Version source bundle."
  default     = ""
}

variable "elastic_beanstalk_application_version_key" {
  description = "(Required) S3 object that is the Application Version source bundle."
  default     = ""
}

variable "elastic_beanstalk_application_version_force_delete" {
  description = "(Optional) On delete, force an Application Version to be deleted when it may be in use by multiple Elastic Beanstalk Environments."
  default     = false
}

#-----------------------------------------------------------
# EB ENV
#-----------------------------------------------------------
variable "enable_elastic_beanstalk_environment" {
  description = "Enable to create elastic_beanstalk_environment"
  default     = false
}

variable "elastic_beanstalk_environment_name" {
  description = "A unique name for this Environment. This name is used in the application URL"
  default     = ""
}

variable "elastic_beanstalk_environment_description" {
  description = "(Optional) Short description of the Environment"
  default     = ""
}

variable "elastic_beanstalk_environment_application" {
  description = "A unique name for this Environment. This name is used in the application URL. If not set, will be used from elastic_beanstalk_application"
  default     = ""
}

variable "elastic_beanstalk_environment_solution_stack_name" {
  description = "(Optional) A solution stack to base your environment off of. Example stacks can be found in the Amazon API documentation"
  default     = "64bit Amazon Linux 2018.03 v2.11.7 running Multi-container Docker 18.06.1-ce (Generic)"
}

variable "elastic_beanstalk_environment_cname_prefix" {
  description = "(Optional) Prefix to use for the fully qualified DNS name of the Environment."
  default     = null
}

variable "elastic_beanstalk_environment_tier" {
  description = "(Optional) Elastic Beanstalk Environment tier. Valid values are Worker or WebServer. If tier is left blank WebServer will be used."
  default     = "WebServer"
}

variable "elastic_beanstalk_environment_setting" {
  description = "(Optional) Option settings to configure the new Environment. These override specific values that are set as defaults. The format is detailed below in Option Settings."
  default = [
    {
      namespace = "aws:autoscaling:asg"
      name      = "MaxSize"
      value     = "1"
    }
  ]
}

variable "elastic_beanstalk_environment_template_name" {
  description = "(Optional) The name of the Elastic Beanstalk Configuration template to use in deployment"
  default     = null
}

variable "elastic_beanstalk_environment_platform_arn" {
  description = "(Optional) The ARN of the Elastic Beanstalk Platform to use in deployment"
  default     = null
}

variable "elastic_beanstalk_environment_wait_for_ready_timeout" {
  description = "(Default: 20m) The maximum duration that Terraform should wait for an Elastic Beanstalk Environment to be in a ready state before timing out."
  default     = null
}

variable "elastic_beanstalk_environment_poll_interval" {
  description = "The time between polling the AWS API to check if changes have been applied. Use this to adjust the rate of API calls for any create or update action. Minimum 10s, maximum 180s. Omit this to use the default behavior, which is an exponential backoff"
  default     = null
}

variable "elastic_beanstalk_environment_version_label" {
  description = "(Optional) The name of the Elastic Beanstalk Application Version to use in deployment."
  default     = null
}

#-----------------------------------------------------------
# EB configuration template
#-----------------------------------------------------------
variable "enable_elastic_beanstalk_configuration_template" {
  description = "Enable creating beanstalk configuration template"
  default     = false
}

variable "elastic_beanstalk_configuration_template_name" {
  description = "(Required) A unique name for this Template."
  default     = ""
}

variable "elastic_beanstalk_configuration_template_description" {
  description = "(Optional) Short description of the Template"
  default     = ""
}

variable "elastic_beanstalk_configuration_template_environment_id" {
  description = "(Optional) The ID of the environment used with this configuration template"
  default     = ""
}

variable "elastic_beanstalk_configuration_template_application" {
  description = "name of the application to associate with this configuration template"
  default     = ""
}

variable "elastic_beanstalk_configuration_template_solution_stack_name" {
  description = "(Optional) A solution stack to base your Template off of. Example stacks can be found in the Amazon API documentation"
  default     = null
}

variable "elastic_beanstalk_configuration_template_setting" {
  description = "(Optional) Option settings to configure the new Environment. These override specific values that are set as defaults."
  default     = []
}
