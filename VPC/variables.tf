variable "name" {
  default     = "aws_project"
  description = "リソース名"
}

variable "cidr_block" {
  default     = "10.0.0.0/16"
  description = "ＩＰアドレス"
}

variable "public_subnets" {
  default     = ["10.0.1.0/24"]
  description = "パブリックサブネットの配列"
}

variable "private_subnets" {
  default     = []
  description = "プライベートサブネットの配列"
}
