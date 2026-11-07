output "instance_id" {
  description = "Application EC2 instance ID"
  value       = aws_instance.app.id
}

output "public_ip" {
  description = "Application EC2 public IPv4 address"
  value       = aws_instance.app.public_ip
}

output "website_url" {
  description = "Open this URL from an allowed public IP"
  value       = "http://${aws_instance.app.public_ip}"
}

output "cloudwatch_log_group" {
  description = "Nginx log group in CloudWatch"
  value       = aws_cloudwatch_log_group.nginx.name
}

output "aws_region" {
  description = "Region containing the lab"
  value       = var.aws_region
}
