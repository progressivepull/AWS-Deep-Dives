# High-level steps for a CloudFront S3 Origin Demo

1. CloudFront in AWS Console
2. Create Distribution
3. Origin: S3 bucket that has public read permissions and static website hosting enabled.
4. Set alternate CNAME to the name you'll put in Route53
5. Set default root document to index.html
6. Get an ACM certificate for the name you'll put in Route 53
7. Create and Deploy
8. Create an Alias entry in your Route 53 zone pointing to the CloudFront distribution ID

Browse to the website via FQDN in Route53  
Modify a file in the S3 bucket.  
Run an invalidation on the CloudFront distribution.  
Refresh the browser.  
