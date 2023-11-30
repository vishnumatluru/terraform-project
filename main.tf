provider "aws" {

}
resource "aws_s3_bucket" "vishnumatluru-bucket" {
  bucket = var.bucket

}
