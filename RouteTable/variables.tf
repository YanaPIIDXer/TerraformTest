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

variable "gateways" {
  default     = []
  description = "ゲートウェイとcidr_blockの配列"
}

/*
// HACK:「本当はinternet_gateway_idがnullか？」で判断したいのだが、
//      それをやると値を放り込んだ時に「この値はapplyするまで何か分からんよ」といわれてplanが失敗する。
//      良くない書き方だが今のところ止む無しの措置。
variable "use_internet_gateway" {
  default     = false
  description = "インターネットゲートウェイを使用するか？"
}

variable "internet_gateway_id" {
  description = "use_internet_gatewayがtrueの時に使用するインターネットゲートウェイのＩＤ。"
}
*/
