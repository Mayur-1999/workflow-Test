terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}
provider "google" {
  credentials = <<EOT
{
  "type": "service_account",
  "project_id": "qwiklabs-gcp-02-3b220788b71a",
  "private_key_id": "16c22e5ecceba0c9cafccfe89bd6b5538351ec09",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQDL39Td7GxoHfYr\n6GJivVx/aWIUuTVllH8uKfo5jy5D+U08vEDajR2SW30+zHXYw7oTykyExVXBKsYM\n4aXA5bNNKWBQJqo5mqwHx8ZuyJEBujYAGngmrzXTYIOCLL7QN8rDD3OFP2X/7QNI\nDcEpSB9xgPx2+RD9k1o/cgXOXAN5F/I9WZ+VadjExKFbV2ybwpIXYOaDU9gNUORh\nd+EI6uHVt2OnzIVulUER3TMULIe2s/cDj0NilmuSKRcwJ5pv9GWHbAUVX3sA2XrP\nzAE0yYEg8HZVomOw3Ok5Nn64BVJnj+yDwee7sYwpIxTn/D+3tZylhK6YozzQ1x6a\ncblHlGG5AgMBAAECggEAFJoSthbeORK/Bb6a05jIXDk7X7X8EP7lr7Xu+upOvfB3\nR0IMSTGNqZSsdkA9z+jueLG+lAOnd+jRQOu7/t9PZEagPJU9qirIw9QCp78FlT+6\nlX3XQqx9s1WrUGgiY6Lhrt60uSQ4E9nA9ULrkDcBM2x6BrFCT+eYLPViJBFtCetM\n3M3BpuLzanCjpVQGW9DiW3N6/ybGhwyISsfaAecmxKTcYY7i+h9qNfkItxbAXbIM\n5vaf1/4yThCm40a1tzBV2/+rB+cAyN3+DajP3vVMconJVgLde5kKdc3NUYtCYixb\nh7n16wWkbbjUKHDHkXsRGKboKmvQmSMGLbCcbKl74QKBgQD3u/c3TS2MLmuc9Xzy\neEa/K8V3W7CakAhg8tEdS9EfXtBZ82LY9GGKl2dWBlduZ5QMvFUjAo1HRl7I77DM\njwq7a84BfTTDxyVISdRO8Dac2UOmOts11qQZV9TjBnXBh6pfY/4GdriTTnuXYG+Q\nxPnEq5cWn6BMI4NUiwX3PZi6IQKBgQDSrTv8UmXe+XyosHOh0dWLxZdPTDblkxUj\nDCbpFtjwCFVftNZaGPpv01WJFv66RGpgSGooi9Sn1cH8pzJU1Uy3jUcHVh9zOxW0\nKadyVzzfZ/K06KEh/w9AHNK2wOO0+zd6cM05YVLszv1eLeLRHn7/RA3yENB0mthm\nGorgPhCkmQKBgQDr4jw4mfIeoiyxXUZFkaS7brAtQE7ePPrdZRccMA7FMgBtRcP/\nFGK0Fgm87XjelR1xKvpdxZZEIYsrBJ9xh1oOr02OOWu+ZqbnN/VB3JQDsRQq+au0\njdXek7UPHh2N0uG0xn8gJHcHPBmOP7K7Q/MXAtNwJTn6hW4NV/qsOihsQQKBgQCM\nr0pDcPK+N3RbYZmWEf28XLJyLb7rB5Ex2keRl8Q+ZhI82xHZEJ0MV9/isAxibpVq\nvnDFqrrTaRcllLEznUyhtiIccBKIbIhNyxMac88ekNeunzoa7axNb/H2QFDO5oNh\nrDofezJZGNBxN8sjQm4kIFn/r+LEOzMO2+KpZEjQ4QKBgQDnpsoslRQo2yEUqskp\nKDdE3Eo+pP+TFNYUWVNOnIPlPoX6oIBpg/vkZzsuIYYXz8N/N1mKk40OSgzEypCN\nx92WzWBK0+peEjC69yHFjuIaP08a/l3F2K/xcmAXUKvBNLd2Z1viqmWQmFS70i07\nLVtlIh3ox7BRDTz4Fr5NmgLt2Q==\n-----END PRIVATE KEY-----\n",
  "client_email": "test-sa@qwiklabs-gcp-02-3b220788b71a.iam.gserviceaccount.com",
  "client_id": "105572346978018430308",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/test-sa%40qwiklabs-gcp-02-3b220788b71a.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}
EOT
  project = "qwiklabs-gcp-02-3b220788b71a"
  region  = "us-central1"

}
