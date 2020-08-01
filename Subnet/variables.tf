variable "name" {
    default = "aws_project"
    description = "リソース名"
}

variable "vpc_id" {
  description = "ＶＰＣのＩＤ"
}

variable "cidr_block" {
    description = "ＩＰアドレスの範囲"
}
