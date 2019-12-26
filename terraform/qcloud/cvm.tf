# Create a web server
resource "tencentcloud_instance" "web" {
  instance_name              = "web example"
  availability_zone          = "ap-guangzhou-3"
  image_id                   = "img-9qabwvbn"
  instance_type              = "S1.SMALL1"
  system_disk_type           = "CLOUD_PREMIUM"
  internet_max_bandwidth_out = 20
  count                      = 1
}
