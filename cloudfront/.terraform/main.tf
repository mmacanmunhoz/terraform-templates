module "cdn" {
  source = "./modules/cloudfront"


  bucket_s3_id   = ""
  bucket_s3_arn  = ""
  bucket_s3_name = ""

  aliases = [""]

  viewer_certificate = {
    cloudfront_default_certificate = false
    acm_certificate_arn            = data.aws_acm_certificate.studos.arn
    ssl_support_method             = "sni-only"
    minimum_protocol_version       = "TLSv1.2_2021"
  }

  comment             = "Frontend Content Manager CDN Distribution"
  enabled             = true
  is_ipv6_enabled     = true
  price_class         = "PriceClass_All"
  retain_on_delete    = false
  wait_for_deployment = true
  default_root_object = "index.html"

  create_origin_access_identity = true

  geo_restriction = {
    restriction_type = "whitelist"
    locations        = ["BR", ]
  }

  origin_access_identities = {
    access-identity-frontend-namecdn = "access-identity-frontend-namecdn"
  }

  origin = {
    content-manager-web = {
      domain_name = ""
      s3_origin_config = {
        origin_access_identity = "access-identity-frontend-namecdn"
      }
    }
  }


  default_cache_behavior = {
    target_origin_id       = ""
    viewer_protocol_policy = "redirect-to-https"

    allowed_methods = ["GET", "HEAD", "OPTIONS"]
    cached_methods  = ["GET", "HEAD"]
    compress        = true
    query_string    = true

    min_ttl     = 0
    default_ttl = 3600
    max_ttl     = 86400
  }

  tags = local.tags

}