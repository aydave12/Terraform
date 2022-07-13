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
  description = "A list of tag blocks. Each element should have keys named key, value, etc."
  type        = map(string)
  default     = {}
}

#---------------------------------------------------
# AWS xray sampling rule
#---------------------------------------------------
variable "enable_xray_sampling_rule" {
  description = "Enable xray sampling rule usage"
  default     = false
}

variable "xray_sampling_rule_name" {
  description = "The name of the sampling rule."
  default     = ""
}

variable "xray_sampling_rule_priority" {
  description = "(Required) The priority of the sampling rule."
  default     = 1000
}

variable "xray_sampling_rule_version" {
  description = "(Required) The version of the sampling rule format (1 )"
  default     = 1
}

variable "xray_sampling_rule_reservoir_size" {
  description = "(Required) A fixed number of matching requests to instrument per second, prior to applying the fixed rate. The reservoir is not used directly by services, but applies to all services using the rule collectively."
  default     = 1
}

variable "xray_sampling_rule_fixed_rate" {
  description = "(Required) The percentage of matching requests to instrument, after the reservoir is exhausted."
  default     = 0.05
}

variable "xray_sampling_rule_url_path" {
  description = "(Required) Matches the path from a request URL."
  default     = "*"
}

variable "xray_sampling_rule_host" {
  description = "(Required) Matches the hostname from a request URL."
  default     = "*"
}

variable "xray_sampling_rule_http_method" {
  description = "(Required) Matches the HTTP method of a request."
  default     = "*"
}

variable "xray_sampling_rule_service_type" {
  description = "(Required) Matches the origin that the service uses to identify its type in segments."
  default     = "*"
}

variable "xray_sampling_rule_service_name" {
  description = "(Required) Matches the name that the service uses to identify itself in segments."
  default     = "*"
}

variable "xray_sampling_rule_resource_arn" {
  description = "(Required) Matches the ARN of the AWS resource on which the service runs."
  default     = "*"
}

variable "xray_sampling_rule_attributes" {
  description = "(Optional) Matches attributes derived from the request."
  default     = null
}

#---------------------------------------------------
# AWS xray encryption config
#---------------------------------------------------
variable "enable_xray_encryption_config" {
  description = "Enable xray encryption config usage"
  default     = false
}

variable "xray_encryption_config_type" {
  description = "(Required) The type of encryption. Set to KMS to use your own key for encryption. Set to NONE for default encryption."
  default     = "NONE"
}

variable "xray_encryption_config_key_id" {
  description = "(Optional) An AWS KMS customer master key (CMK) ARN."
  default     = null
}

#---------------------------------------------------
# AWS xray group
#---------------------------------------------------
variable "enable_xray_group" {
  description = "Enable xray group usage"
  default     = false
}

variable "xray_group_name" {
  description = "The name of the group."
  default     = ""
}

variable "xray_group_filter_expression" {
  description = "(Required) The filter expression defining criteria by which to group traces. more info can be found in official docs."
  default     = null
}
