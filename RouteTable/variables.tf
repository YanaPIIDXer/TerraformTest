variable "name" {
  default     = "aws_project"
  description = "名前"
}

variable "vpc_id" {
  description = "ＶＰＣのＩＤ"
}

variable "subnets" {
  default     = []
  description = "サブネットの配列"
}

variable "internet_gateway_id" {
  default     = null
  description = "インターネットゲートウェイのＩＤ。指定したら自動的に0.0.0.0/0のルーティングが生成される。"
}
