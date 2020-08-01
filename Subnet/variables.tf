variable "name" {
  default     = "aws_project"
  description = "リソース名"
}

variable "vpc_id" {
  description = "ＶＰＣのＩＤ"
}

variable "cidr_block" {
  default     = "10.0.1.0/24"
  description = "ＩＰアドレスの範囲"
}
