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
  bucket = "www.${terraform.env == "prod" ? "" : "dev."}gshrimpton.com"
  acl    = "public-read"

  policy = <<EOF
{
"Id": "bucket_policy_site",
"Version": "2012-10-17",
"Statement": [
  {
    "Sid": "bucket_policy_site_main",
    "Action": [
      "s3:GetObject"
    ],
    "Effect": "Allow",
    "Resource": "arn:aws:s3:::www.${terraform.env == "prod" ? "" : "dev."}gshrimpton.com/*",
    "Principal": "*"
  }
]
}
EOF

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
  key    = "assets/favicon.png"
  source = "web/assets/favicon.png"
  etag   = "${md5(file("web/assets/favicon.png"))}"
  content_type = "image/png"
}

resource "aws_s3_bucket_object" "styles" {
  bucket = "${aws_s3_bucket.web_bucket.bucket}"
  key    = "index.css"
  source = "web/index.css"
  etag   = "${md5(file("web/index.css"))}"
  content_type = "text/css"
}

resource "aws_s3_bucket_object" "logo" {
  bucket = "${aws_s3_bucket.web_bucket.bucket}"
  key    = "assets/logo.png"
  source = "web/assets/logo.png"
  etag   = "${md5(file("web/assets/logo.png"))}"
  content_type = "image/png"
}