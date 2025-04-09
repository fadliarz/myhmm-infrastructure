resource "aws_s3_bucket" "myhmm-bucket" {
  bucket = var.myhmm_bucket_name
}

variable "myhmm_bucket_name" {
  type    = string
  default = "myhmm-bucket"
}