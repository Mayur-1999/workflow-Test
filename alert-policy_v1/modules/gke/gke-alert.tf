#policy 7
resource "google_monitoring_alert_policy" "policy-gke-01" {
  display_name = "GKE"
  combiner = "OR"
  conditions {
    display_name = "GKE container restarted (cluster)"
    condition_threshold {
      filter = "resource.type = \"k8s_container\" AND metric.type = \"kubernetes.io/container/restart_count\" AND resource.labels.cluster_name=\"${var.CLUSTER_NAME}\" AND resource.labels.location=\"${var.CLUSTER_LOCATION}\""
      duration = "0s"
      comparison = "COMPARISON_GT"
      threshold_value =  1
      trigger {
          count = 1
      }
      aggregations {
        alignment_period = "300s"
        per_series_aligner =  "ALIGN_DELTA"
        cross_series_reducer = "REDUCE_NONE"
      }
    }
  }


conditions {
    display_name = "GKE container has restarted (ALL)"
    condition_threshold {
      filter = "resource.type = \"k8s_container\" AND metric.type = \"kubernetes.io/container/restart_count\""
      comparison = "COMPARISON_GT"
      duration = "0s"
      threshold_value =  1
      trigger {
          count = 1
      }
      aggregations {
        alignment_period = "300s"
        per_series_aligner =  "ALIGN_DELTA"
        cross_series_reducer = "REDUCE_NONE"
      }
    }
  }

  conditions {
    display_name = "GKE Container high memory limit utilization"
    condition_threshold {
      filter = "resource.type = \"k8s_container\" AND metric.type = \"kubernetes.io/container/memory/limit_utilization\""
      comparison = "COMPARISON_GT"
      threshold_value =  0.9
      duration = "0s"
      trigger {
          count = 1
      }
      aggregations {
        alignment_period = "60s"
        per_series_aligner =  "ALIGN_MEAN"
        cross_series_reducer = "REDUCE_NONE"
      }
    }
  }

conditions {
    display_name = "GKE Container - High CPU Limit Utilization (all containers)"
    condition_threshold {
      filter = "resource.type = \"k8s_container\" AND metric.type = \"kubernetes.io/container/cpu/limit_utilization\""
      comparison = "COMPARISON_GT"
      threshold_value =  0.9
       duration = "0s"
      trigger {
          count = 1
      }
      aggregations {
        alignment_period = "300s"
        per_series_aligner =  "ALIGN_MEAN"
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