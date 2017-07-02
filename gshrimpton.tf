provider "aws" {
  region  = "eu-west-2"
}

terraform {
  backend "s3" {
    bucket  = "www.gshrimpton.com.terraform"
    key     = "network/terraform-dev.tfstate"
    region  = "eu-west-2"
  }
}

resource "aws_s3_bucket" "web_bucket" {
  bucket = "www.gshrimpton.com"
  acl    = "public-read"

  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}

resource "aws_s3_bucket_object" "homepage" {
  bucket = "${aws_s3_bucket.web_bucket.bucket}"
  key    = "index.html"
  source = "web/index.html"
  etag   = "${md5(file("web/index.html"))}"
  content_type = "text/html"
}