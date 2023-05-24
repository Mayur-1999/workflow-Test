resource "google_monitoring_alert_policy" "policy-spanner-01" {
  display_name = "Spanner Alerts"
  combiner     = "OR"
  enabled      = true
  conditions {
    display_name = "Spanner - CPU Utilization"
    condition_threshold {
      filter     = "resource.type = \"spanner_instance\" AND metric.type = \"spanner.googleapis.com/instance/cpu/utilization\""
      duration   = "60s"
      comparison = "COMPARISON_GT"
      threshold_value = 0.9
      trigger {
        count = 1
      }
      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_MEAN"
        cross_series_reducer = "REDUCE_NONE"
      }
      evaluation_missing_data = "EVALUATION_MISSING_DATA_INACTIVE"
    }
  }
  conditions {
    display_name = "Spanner - Storage utilization"
    condition_threshold {
      filter     = "resource.type = \"spanner_instance\" AND metric.type = \"spanner.googleapis.com/instance/storage/utilization\""
      duration   = "60s"
      comparison = "COMPARISON_GT"
      threshold_value = 0.9
      trigger {
        count = 1
      }
      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_MAX"
        cross_series_reducer = "REDUCE_NONE"
      }
      evaluation_missing_data = "EVALUATION_MISSING_DATA_INACTIVE"
    }
  }
  conditions {
    display_name = "Spanner - Request latencies"
    condition_threshold {
      filter     = "resource.type = \"spanner_instance\" AND metric.type = \"spanner.googleapis.com/api/request_latencies\""
      duration   = "60s"
      comparison = "COMPARISON_GT"
      threshold_value = 20
      trigger {
        count = 1
      }
      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_PERCENTILE_99"
        cross_series_reducer = "REDUCE_NONE"
      }
      evaluation_missing_data = "EVALUATION_MISSING_DATA_INACTIVE"
    }
  }
  conditions {
    display_name = "Spanner - API request rate"
    condition_threshold {
      filter     = "resource.type = \"spanner_instance\" AND metric.type = \"spanner.googleapis.com/api/request_count\""
      duration   = "60s"
      comparison = "COMPARISON_GT"
      threshold_value = 40
      trigger {
        count = 1
      }
      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_MEAN"
        cross_series_reducer = "REDUCE_NONE"
      }
      evaluation_missing_data = "EVALUATION_MISSING_DATA_INACTIVE"
    }
  }
  conditions {
    display_name = "Spanner - Compute Capacity"
    condition_threshold {
      filter     = "resource.type = \"spanner_instance\" AND metric.type = \"spanner.googleapis.com/instance/processing_units\""
      duration   = "60s"
      comparison = "COMPARISON_LT"
      threshold_value = 90
      trigger {
        count = 1
      }
      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_MEAN"
        cross_series_reducer = "REDUCE_NONE"
      }
      evaluation_missing_data = "EVALUATION_MISSING_DATA_INACTIVE"
    }
  }
    alert_strategy {
        auto_close = "604800s"
    }
  notification_channels = [var.COE_team.notification_channel_id]
}