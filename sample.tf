#provider block
provider "aws" {
    region = "us-east-1"
    default_tags {
      tags = {         #adding default tags to the provider
          Application = "static_website"
          Owner = "john"
      }
    }
}
#creating the website module