resource "random_id" "bucket_suffix" {
  byte_length = 6
}

resource "aws_s3_bucket" "terraform_bucket" {
  bucket = "terraform-bucket-${random_id.bucket_suffix.hex}"
}

output "bucket_name" {
  value = aws_s3_bucket.terraform_bucket.bucket
}

# bucket_name = "terraform-bucket-c6b2e88e4e95"