# modules/ec2/outputs.tf

output "primary_public_ip" {
  value       = aws_instance.prometheus-primary.public_ip
  description = "Public IP of the primary Prometheus instance"
}

output "secondary_public_ip" {
  value       = aws_instance.prometheus-secondary.public_ip
  description = "Public IP of the secondary Prometheus instance"
}

output "primary_private_ip" {
  value       = aws_instance.prometheus-primary.private_ip
  description = "Private IP of the primary Prometheus instance"
}

output "secondary_private_ip" {
  value       = aws_instance.prometheus-secondary.private_ip
  description = "Private IP of the secondary Prometheus instance"
}

output "primary_eip" {
  value       = aws_eip.primary_eip.public_ip
  description = "Public IP of the primary Elastic IP"
}

output "secondary_eip" {
  value       = aws_eip.secondary_eip.public_ip
  description = "Public IP of the secondary Elastic IP"
}
