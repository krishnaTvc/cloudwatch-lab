variable "aws_region" {
  description = "Region to deploy resources"
  type        = string
  default     = "eu-north-1"
}
variable "project_name" {
  description = "prefix for all resources"
  type        = string
  default     = "cloudwatch-lab"
}
variable "instance_type" {
  description = "aws ec2 instance type"
  type        = string
  default     = "t3.micro"
}
variable "allowed_web_cidrs" {
  description = "list of allowed cidr blocks for web access"
  type        = list(string)
  validation {
    condition = (
      length(var.allowed_web_cidrs) > 0 &&
      alltrue([for cidr in var.allowed_web_cidrs :
        can(cidrnetmask(cidr))
      ])

    )
    error_message = "Provide at least one valid IPv4 CIDR, such as 0.0.0.0/32."
  }
}
variable "log_retention_days" {
  description = "number of days to retain cloudwatch logs"
  type        = number
  default     = 3


}
