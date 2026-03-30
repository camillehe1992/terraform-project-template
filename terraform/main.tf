data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

resource "aws_s3_bucket" "hello_world" {
  bucket = "my-hello-world-bucket-for-demo-${data.aws_region.current.region}"
}
