terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.2.0"
    }
  }
}

# Configuramos el provider para AWS
provider "aws" {
  region     = "us-east-1"
  access_key = ""
  secret_key = ""
}

# Creamos el bucket
resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-bucket-clase7-ucreativa"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

# Creamos el policy
resource "aws_s3_bucket_policy" "allow_access_from_anyone" {
  bucket = aws_s3_bucket.b.id
  policy = data.aws_iam_policy_document.allow_access_from_anyone.json
}


data "aws_iam_policy_document" "allow_access_from_anyone" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]

    resources = [
      aws_s3_bucket.b.arn,
      "${aws_s3_bucket.b.arn}/*",
    ]
  }
}

resource "aws_s3_bucket_website_configuration" "example" {
  bucket = aws_s3_bucket.b.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  routing_rule {
    condition {
      key_prefix_equals = "docs/"
    }
    redirect {
      replace_key_prefix_with = "documents/"
    }
  }
}
