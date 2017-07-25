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

resource "aws_s3_bucket_object" "favicon" {
  bucket = "${aws_s3_bucket.web_bucket.bucket}"
  key    = "favicon.png"
  source = "web/favicon.png"
  etag   = "${md5(file("web/favicon.png"))}"
  content_type = "image/png"
}

resource "aws_s3_bucket_object" "styles" {
  bucket = "${aws_s3_bucket.web_bucket.bucket}"
  key    = "index.css"
  source = "web/index.css"
  etag   = "${md5(file("web/index.css"))}"
  content_type = "text/css"
}

resource "aws_s3_bucket_object" "logo-large" {
  bucket = "${aws_s3_bucket.web_bucket.bucket}"
  key    = "logo-large.svg"
  source = "web/logo-large.svg"
  etag   = "${md5(file("web/logo-large.svg"))}"
  content_type = "image/svg+xml"
}