resource "google_monitoring_alert_policy" "policy-vm-01" {
  display_name = "VM-cpu-disk-fw-uptime"
  combiner = "OR"
  conditions {
    display_name = "VM Instance - CPU utilization"
    condition_threshold {
      filter = "resource.type = \"gce_instance\" AND metric.type = \"compute.googleapis.com/instance/cpu/utilization\""
      duration = "60s"
      comparison = "COMPARISON_GT"
      threshold_value = 90
      trigger {
          count = 1
      }
      aggregations {
        alignment_period = "60s"
        per_series_aligner = "ALIGN_MEAN"
        cross_series_reducer = "REDUCE_COUNT"
      }
    }
  }
  conditions {
    display_name = "VM Instance - Disk usage"
    condition_threshold {
      filter = "resource.type = \"gce_instance\" AND metric.type = \"compute.googleapis.com/guest/disk/bytes_used\""
      duration = "60s"
      comparison = "COMPARISON_GT"
      threshold_value =  200000000000 #186 Gi
      trigger {
          count = 1
      }
      aggregations {
        alignment_period = "300s"
        per_series_aligner = "ALIGN_MEAN"
        cross_series_reducer = "REDUCE_NONE"
      }
    }
  }

  conditions {
    display_name = "VM Instance - High memory utilization"
    condition_threshold {
      filter = "resource.type = \"gce_instance\" AND metric.type = \"agent.googleapis.com/memory/percent_used\" AND metric.labels.state = \"used\""
      duration = "0s"
      comparison = "COMPARISON_GT"
      threshold_value = 90
      trigger {
          count = 1
      }
      aggregations {
        alignment_period = "300s"
        per_series_aligner = "ALIGN_MEAN"
        cross_series_reducer = "REDUCE_NONE"
      }
    }
  }
   conditions {
    display_name = "Firewall - Dropped bytes"
    condition_threshold {
      filter = "resource.type = \"gce_instance\" AND metric.type = \"compute.googleapis.com/firewall/dropped_bytes_count\""
      duration = "0s"
      comparison = "COMPARISON_GT"
      threshold_value =  7000
      trigger {
          count = 1
      }
      aggregations {
        alignment_period = "300s"
        per_series_aligner = "ALIGN_MEAN"
        cross_series_reducer = "REDUCE_NONE"
      }
    }
  } 

  conditions {
    display_name = "VM Instance - Uptime"
    condition_threshold {
      filter =  "resource.type = \"gce_instance\" AND metric.type = \"compute.googleapis.com/instance/uptime\""
      duration = "0s"
      comparison = "COMPARISON_GT"
      threshold_value =  800
      trigger {
          count = 1
      }
      aggregations {
        alignment_period = "300s"
        per_series_aligner = "ALIGN_MEAN"
        cross_series_reducer = "REDUCE_NONE"
      }
    }
  }

conditions {
    display_name = "Google Cloud External Network Load Balancer Rule - RTT latencies"
    condition_threshold {
      filter = "resource.type = \"loadbalancing.googleapis.com/ExternalNetworkLoadBalancerRule\" AND metric.type = \"loadbalancing.googleapis.com/l3/external/rtt_latencies\""
      duration = "0s"
      comparison = "COMPARISON_GT"
      threshold_value =  2000
      trigger {
          count = 1
      }
      aggregations {
        alignment_period = "300s"
        per_series_aligner = "ALIGN_PERCENTILE_99"
        cross_series_reducer = "REDUCE_NONE"
      }
    }
  }

#   documentation {
#     content = 
#   }
  notification_channels = [var.COE_team.notification_channel_id]
}