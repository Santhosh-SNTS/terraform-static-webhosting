
# bucket resource block
resource "aws_s3_bucket" "mybucket-santhosh" {
  bucket = "codintestbucket-9600"
  acl    = "public-read"
  policy = file("public-policy.json")

  website {
    index_document = "index.html"
    # error_document = "error.html"
    routing_rules = <<EOF
[{
    "Condition": {
        "KeyPrefixEquals": "docs/"
    },
    "Redirect": {
        "ReplaceKeyPrefixWith": "documents/"
    }
}]
EOF
  }
}
#upload the single file into s3 bucket
resource "aws_s3_bucket_object" "S3SingleObject" {
  bucket = aws_s3_bucket.mybucket-santhosh.id
  key = "index.html"
  source = "C:\\Users\\santhosh Josephraj\\OneDrive - Codin City\\Desktop\\Pictory\\topics\\S3\\statichosting\\index.html"
  etag = filemd5("C:\\Users\\santhosh Josephraj\\OneDrive - Codin City\\Desktop\\Pictory\\topics\\S3\\statichosting\\index.html")

}
#URL
output "website_endpoint" {
  value = aws_s3_bucket.mybucket-santhosh.website_endpoint
}