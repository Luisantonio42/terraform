resource "random_id" "bucket_suffix" {
  byte_length = 6
}

resource "aws_s3_bucket" "terraform_bucket_west_1" {
  bucket   = "terraform-bucket-west1-${random_id.bucket_suffix.hex}"
  provider = aws.us-west-1
}

resource "aws_s3_bucket" "terraform_bucket_west_2" {
  bucket = "terraform-bucket-west2-${random_id.bucket_suffix.hex}"
}

output "bucket_west1_name" {
  value = aws_s3_bucket.terraform_bucket_west_1.bucket
}

output "bucket_west2_name" {
  value = aws_s3_bucket.terraform_bucket_west_2.bucket
}

# bucket_name = "terraform-bucket-c6b2e88e4e95"