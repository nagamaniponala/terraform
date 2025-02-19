output "az" {
  value = aws_instance.dev.availability_zone

}
output "ip" {
  value = aws_instance.dev.public_ip

}

output "privateIP" {
  value = aws_instance.dev.public_ip
  sensitive = true

}