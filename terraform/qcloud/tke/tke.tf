#examples for MANAGED_CLUSTER  cluster
resource "tencentcloud_kubernetes_cluster" "managed_cluster" {
  # https://cloud.tencent.com/document/product/457/9315
  cluster_version         = "1.16.3"
  vpc_id                  = var.vpc
  cluster_cidr            = "10.1.0.0/16"
  cluster_max_pod_num     = 32
  cluster_name            = "kube-sg"
  cluster_desc            = "test cluster desc"
  cluster_max_service_num = 32


  #worker_config {
  #  count                      = 1
  #  availability_zone          = var.availability_zone
  #  instance_type              = var.default_instance_type
  #  #system_disk_type           = "CLOUD_SSD"
  #  #system_disk_size           = 60
  #  internet_charge_type       = "TRAFFIC_POSTPAID_BY_HOUR"
  #  internet_max_bandwidth_out = 1
  #  public_ip_assigned         = true
  #  subnet_id                  = var.subnet

  #  data_disk {
  #    disk_type = "CLOUD_PREMIUM"
  #    disk_size = 50
  #  }

  #  enhanced_security_service = false
  #  enhanced_monitor_service  = false
  #  user_data                 = "IyEvYmluL2Jhc2gKCmN1cmwgaHR0cHM6Ly9pbml0LmFpcmRiLmhvc3Qvb3Npbml0L3VidW50dV9pbml0LnNoIHwgYmFzaCAt"
  #  password                  = "ZZXXccvv1212"
  #}

  cluster_deploy_type = "MANAGED_CLUSTER"

  tags = {
    "test" = "test"
  }

}

resource "tencentcloud_kubernetes_cluster_attachment" "test_attach" {
  cluster_id  = tencentcloud_kubernetes_cluster.managed_cluster.id
  #instance_id = tencentcloud_instance.foo.id
  instance_id = "ins-9fx72mva"
  key_ids = ["skey-ppoj5mr5"]
  #password    = "Lo4wbdit"
}
