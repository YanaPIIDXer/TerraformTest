output "vpc_id" {
  value       = aws_vpc.default.id
  description = "生成されたVPCのID"
}

output "internet_gateway_id" {
    value = aws_internet_gateway.internet_gateway.id
    description = "インターネットゲートウェイのＩＤ"
}
