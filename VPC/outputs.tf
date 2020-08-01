output "vpc_id" {
  value       = aws_vpc.default.id
  description = "生成されたVPCのID"
}

output "internet_gateway_id" {
  value       = aws_internet_gateway.internet_gateway.id
  description = "インターネットゲートウェイのＩＤ"
}

output "public_subnets" {
  value       = aws_subnet.public_subnets
  description = "パブリックサブネットの配列"
}

output "private_subnets" {
  value       = aws_subnet.private_subnets
  description = "パブリックサブネットの配列"
}
