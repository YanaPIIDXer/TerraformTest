variable "name" {
  default     = "aws_project"
  description = "名前"
}

variable "identifier" {
    default = "aws-project"
    description = "識別名"
}

variable "subnets" {
    description = "サブネットの配列"
}

variable "storage" {
    default = {
        type = "gp2"
        allocated_size = 20
    }
    description = "ストレージの設定"
}

variable "instance_class" {
    default = "db.t3.micro"
    description = "インスタンスクラス"
}

variable "engine" {
    default = {
        prog = "mysql"
        version = "8.0"
        // ↓versionから取り出せないかな・・・？
        major_version = "8.0"
    }
    description = "DBエンジンの設定"
}

variable "db_data" {
    default = {
        db_name = "test"
        user_name = "root"
        password = "password"
    }
    description = "データベースの情報"
}

variable "security_groups" {
    description = "セキュリティグループの配列"
}

variable "time_zone" {
    default = "Asia/Tokyo"
    description = "タイムゾーン"
}

variable "charset" {
    default = {
        server = "utf8"
        client = "utf8"
    }
    description = "サーバ・クライアントそれぞれで使用する文字コード"
}
