module "apigateway" {
  source    = "./modules/apigateway"
  namespace = "stagging"
  api_name  = "cqt-gateway"

  api_throttling_rate_limit  = 10000
  api_throttling_burst_limit = 5000
  api_metrics_enabled        = false
  enable_cloudwatch_alarmes  = false
  xray_tracing_enabled       = false
  api_template               = file("../services/api/cqt-gateway.yml")
  resources                  = null
  resource_tag_name          = "d-server-00lpu89rymdv9m"

}


