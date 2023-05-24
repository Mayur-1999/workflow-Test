resource "google_monitoring_alert_policy" "policy-http-le-01" {
  display_name = "http Request Latency"
  combiner = "OR"
  conditions {
    display_name = "Request Latency"
    condition_threshold {
      filter = "resource.type = \"prometheus_target\" AND metric.type = \"prometheus.googleapis.com/http_response_time_seconds/histogram\""
      duration = "0s"
      comparison = "COMPARISON_GT"
      threshold_value =  0.50
      trigger {
          count = 1
      }
      aggregations {
        alignment_period = "300s"
        per_series_aligner = "ALIGN_DELTA"
        cross_series_reducer = "REDUCE_MEAN"
      }
    }
  }

  conditions {
    display_name = "latency 99th"
    condition_threshold {
      filter = "resource.type = \"prometheus_target\" AND metric.type = \"prometheus.googleapis.com/http_response_time_seconds/histogram\""
      duration = "0s"
      comparison = "COMPARISON_GT"
      threshold_value =  0.99
      trigger {
          count = 1
      }
      aggregations {
        alignment_period = "300s"
        per_series_aligner = "ALIGN_DELTA"
        cross_series_reducer = "REDUCE_PERCENTILE_99"
        group_by_fields = [ "metric.label.path" ]
      }
    }
  }

  conditions {
    display_name = "latency 95th"
    condition_threshold {
      filter = "resource.type = \"prometheus_target\" AND metric.type = \"prometheus.googleapis.com/http_response_time_seconds/histogram\""
      duration = "0s"
      comparison = "COMPARISON_GT"
      threshold_value =  0.95
      trigger {
          count = 1
      }
      aggregations {
        alignment_period = "60s"
        per_series_aligner = "ALIGN_DELTA"
        cross_series_reducer = "REDUCE_PERCENTILE_95"
        group_by_fields = [ "metric.label.path" ]
      }
    }
  }

  alert_strategy {
    auto_close =  "604800s"
  }
#   documentation {
#     content = ""
#   }
  notification_channels = [var.COE_team.notification_channel_id]
  
}


#http errors 4XX - On all Paths
resource "google_monitoring_alert_policy" "policy-err-4xx-01" {
  display_name = "http API errors 4xx"
  combiner = "OR"
  conditions {
    display_name = "API-404 — Not Found"
    condition_threshold {
      filter = "resource.type = \"prometheus_target\" AND metric.type = \"prometheus.googleapis.com/http_requests_total/counter\" AND metric.labels.status = \"404\""
      duration = "0s"
      comparison = "COMPARISON_GT"
      threshold_value =  0.15
      trigger {
          count = 1
      }
      aggregations {
        alignment_period = "300s"
        per_series_aligner = "ALIGN_RATE"
        cross_series_reducer = "REDUCE_NONE"
      }
    }
  }

  conditions {
    display_name = "API-401 — Unauthorized"
    condition_threshold {
      filter = "resource.type = \"prometheus_target\" AND metric.type = \"prometheus.googleapis.com/http_requests_total/counter\" AND metric.labels.status = \"401\""
      duration = "0s"
      comparison = "COMPARISON_GT"
      threshold_value =  0.15
      trigger {
          count = 1
      }
      aggregations {
        alignment_period = "300s"
        per_series_aligner = "ALIGN_RATE"
        cross_series_reducer = "REDUCE_NONE"
      }
    }
  }

   conditions {
    display_name = "API-403 — Forbidden"
    condition_threshold {
      filter = "resource.type = \"prometheus_target\" AND metric.type = \"prometheus.googleapis.com/http_requests_total/counter\" AND metric.labels.status = \"403\""
      duration = "0s"
      comparison = "COMPARISON_GT"
      threshold_value =  0.15
      trigger {
          count = 1
      }
      aggregations {
        alignment_period = "300s"
        per_series_aligner = "ALIGN_RATE"
        cross_series_reducer = "REDUCE_NONE"
      }
    }
  }

   conditions {
    display_name = "API-402 - Payment Required"
    condition_threshold {
      filter = "resource.type = \"prometheus_target\" AND metric.type = \"prometheus.googleapis.com/http_requests_total/counter\" AND metric.labels.status = \"402\""
      duration = "0s"
      comparison = "COMPARISON_GT"
      threshold_value =  0.15
      trigger {
          count = 1
      }
      aggregations {
        alignment_period = "300s"
        per_series_aligner = "ALIGN_RATE"
        cross_series_reducer = "REDUCE_NONE"
      }
    }
  }
  alert_strategy {
    auto_close =  "604800s"
  }
#   documentation {
#     content = ""
#   }
  notification_channels = [var.COE_team.notification_channel_id]
}




#http errors 5XX - On all Paths

resource "google_monitoring_alert_policy" "policy-err-5xx-01" {
  display_name = "http  API errors 5xx"
  combiner = "OR"
  conditions {
    display_name = "API-500 - Internal Server Error"
    condition_threshold {
      filter = "resource.type = \"prometheus_target\" AND metric.type = \"prometheus.googleapis.com/http_requests_total/counter\" AND metric.labels.status = \"500\""
      duration = "0s"
      comparison = "COMPARISON_GT"
      threshold_value =  0.15
      trigger {
          count = 1
      }
      aggregations {
        alignment_period = "300s"
        per_series_aligner = "ALIGN_RATE"
        cross_series_reducer = "REDUCE_NONE"
      }
    }
  }

  conditions {
    display_name = "API-501 - Not Implemented"
    condition_threshold {
      filter = "resource.type = \"prometheus_target\" AND metric.type = \"prometheus.googleapis.com/http_requests_total/counter\" AND metric.labels.status = \"501\""
      duration = "0s"
      comparison = "COMPARISON_GT"
      threshold_value =  0.15
      trigger {
          count = 1
      }
      aggregations {
        alignment_period = "300s"
        per_series_aligner = "ALIGN_RATE"
        cross_series_reducer = "REDUCE_NONE"
      }
    }
  }

   conditions {
    display_name = "API-502 -	Bad Gateway"
    condition_threshold {
      filter = "resource.type = \"prometheus_target\" AND metric.type = \"prometheus.googleapis.com/http_requests_total/counter\" AND metric.labels.status = \"502\""
      duration = "0s"
      comparison = "COMPARISON_GT"
      threshold_value =  0.15
      trigger {
          count = 1
      }
      aggregations {
        alignment_period = "300s"
        per_series_aligner = "ALIGN_RATE"
        cross_series_reducer = "REDUCE_NONE"
      }
    }
  }

   conditions {
    display_name = "API-503 - Service Unavailable"
    condition_threshold {
      filter = "resource.type = \"prometheus_target\" AND metric.type = \"prometheus.googleapis.com/http_requests_total/counter\" AND metric.labels.status = \"503\""
      duration = "0s"
      comparison = "COMPARISON_GT"
      threshold_value =  0.15
      trigger {
          count = 1
      }
      aggregations {
        alignment_period = "300s"
        per_series_aligner = "ALIGN_RATE"
        cross_series_reducer = "REDUCE_NONE"
      }
    }
  }

  conditions {
    display_name = "API-504 - Gateway Timeout"
    condition_threshold {
      filter = "resource.type = \"prometheus_target\" AND metric.type = \"prometheus.googleapis.com/http_requests_total/counter\" AND metric.labels.status = \"504\""
      duration = "0s"
      comparison = "COMPARISON_GT"
      threshold_value =  0.15
      trigger {
          count = 1
      }
      aggregations {
        alignment_period = "300s"
        per_series_aligner = "ALIGN_RATE"
        cross_series_reducer = "REDUCE_NONE"
      }
    }
  }
  alert_strategy {
    auto_close =  "604800s"
  }
#   documentation {
#     content = ""
#   }
  notification_channels = [var.COE_team.notification_channel_id]
}




#policy 1
resource "google_monitoring_alert_policy" "policy-cart-checkout-le-01" {
  display_name = "cart-checkout-latency"
  combiner = "OR"
  conditions {
    display_name = "cart 95th percentile"
    condition_threshold {
      filter = "resource.type = \"prometheus_target\" AND metric.type = \"prometheus.googleapis.com/http_requests_total/counter\" AND metric.labels.path = \"/cart\""
      duration = "0s"
      comparison = "COMPARISON_GT"
      threshold_value =  0.95
      trigger {
          count = 1
      }
      aggregations {
        alignment_period = "300s"
        per_series_aligner =  "ALIGN_DELTA"
        cross_series_reducer = "REDUCE_PERCENTILE_95"
        group_by_fields = [ "metric.label.path" ]
      }
    }
  }

  conditions {
    display_name = "cart 99th percentile"
    condition_threshold {
      filter = "resource.type = \"prometheus_target\" AND metric.type = \"prometheus.googleapis.com/http_requests_total/counter\" AND metric.labels.path = \"/cart\""
      duration = "0s"
      comparison = "COMPARISON_GT"
      threshold_value =  0.99
      trigger {
          count = 1
      }
      aggregations {
        alignment_period = "300s"
        per_series_aligner =  "ALIGN_DELTA"
        cross_series_reducer = "REDUCE_NONE"
        group_by_fields = [ "metric.label.path" ]
      }
    }
  }

   conditions {
    display_name = "checkout 99th percentile"
    condition_threshold {
      filter = "resource.type = \"prometheus_target\" AND metric.type = \"prometheus.googleapis.com/http_requests_total/counter\" AND metric.labels.path = \"/cart/checkout\""
      comparison = "COMPARISON_GT"
      duration = "0s"
      threshold_value =  0.99
      trigger {
          count = 1
      }
      aggregations {
        alignment_period = "300s"
        per_series_aligner =  "ALIGN_DELTA"
        cross_series_reducer = "REDUCE_NONE"
        group_by_fields = [ "metric.label.path" ]
      }
    }
  }

   conditions {
    display_name = "checkout 95th percentile"
    condition_threshold {
      filter = "resource.type = \"prometheus_target\" AND metric.type = \"prometheus.googleapis.com/http_requests_total/counter\" AND metric.labels.path = \"/cart/checkout\""
      comparison = "COMPARISON_GT"
      duration = "0s"
      threshold_value =  0.95
      trigger {
          count = 1
      }
      aggregations {
        alignment_period = "300s"
        per_series_aligner =  "ALIGN_DELTA"
        cross_series_reducer = "REDUCE_PERCENTILE_95"
        group_by_fields = [ "metric.label.path" ]
      }
    }
  }
  alert_strategy {
    auto_close =  "604800s"
  }
#   documentation {
#     content = ""
#   }
  notification_channels = [var.COE_team.notification_channel_id]
}