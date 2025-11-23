output "vpc_id" {
  description = "VPC ID"
  value = aws_vpc.solar-vpc.id
}

output "private_subnet_ids" {
  description = "Private subnets IDS"
  value = aws_subnet.private_subnets[*].id
}

output "public_subnet_ids" {
  description = "public subnets IDS"
  value = aws_subnet.public_subnets[*].id
}