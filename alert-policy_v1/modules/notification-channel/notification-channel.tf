resource "google_monitoring_notification_channel" "COE_team" {
    display_name = "COE team Channel"
    type         = "email"
    labels = {
        email_address = "123@cognizant.com"
    }
  force_delete = false
}