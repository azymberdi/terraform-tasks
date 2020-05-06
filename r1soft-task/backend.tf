terraform {
  required_version = "0.11.14"

  backend "s3" {
    bucket = "rash-terraform-bucket"

    #dynamodb_table    =   "state_class"
    key    = "path/to/my/key"
    region = "us-east-1"
  }
}
