resource "yandex_iam_service_account" "service-acc" {
  name        = "service-acc"
  description = "admin service account"
}