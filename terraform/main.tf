data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

resource "aws_s3_bucket" "state_bucket" {
  bucket = "my-hello-world-${data.aws_caller_identity.current.account_id}-${data.aws_region.current.region}"
}
