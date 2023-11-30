terraform {
  backend "s3" {
    bucket = "vishnumatluru-bucket-1"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }


}