#examples for MANAGED_CLUSTER  cluster
resource "tencentcloud_kubernetes_cluster" "managed_cluster" {
  vpc_id                  = var.vpc
  cluster_cidr            = "172.16.0.0/16"
  #cluster_max_pod_num     = 64
  cluster_name            = "kube-sg"
  cluster_desc            = "test cluster desc"
  #cluster_max_service_num = 1024

  worker_config {
    count                      = 1
    availability_zone          = var.availability_zone
    instance_type              = var.default_instance_type
    subnet_id                  = var.subnet

    instance_name = sg.airdb.host
    enhanced_security_service = false
    enhanced_monitor_service  = false
    user_data                 = "dGVzdA=="
    password                  = "ZZXXccvv1212"
  }

  cluster_deploy_type = "MANAGED_CLUSTER"

  tags = {
    "test" = "test"
  }
}

/*
#examples for INDEPENDENT_CLUSTER  cluster
resource "tencentcloud_kubernetes_cluster" "independing_cluster" {
  vpc_id                  = var.vpc
  cluster_cidr            = "10.1.0.0/16"
  cluster_max_pod_num     = 32
  cluster_name            = "test"
  cluster_desc            = "test cluster desc"
  cluster_max_service_num = 32

  master_config {
    count                      = 3
    availability_zone          = var.availability_zone
    instance_type              = var.default_instance_type
    system_disk_type           = "CLOUD_SSD"
    system_disk_size           = 60
    internet_charge_type       = "TRAFFIC_POSTPAID_BY_HOUR"
    internet_max_bandwidth_out = 100
    public_ip_assigned         = true
    subnet_id                  = var.subnet

    data_disk {
      disk_type = "CLOUD_PREMIUM"
      disk_size = 50
    }

    enhanced_security_service = false
    enhanced_monitor_service  = false
    user_data                 = "dGVzdA=="
    password                  = "MMMZZXXccvv1212"
  }

  worker_config {
    count                      = 2
    availability_zone          = var.availability_zone
    instance_type              = var.default_instance_type
    system_disk_type           = "CLOUD_SSD"
    system_disk_size           = 60
    internet_charge_type       = "TRAFFIC_POSTPAID_BY_HOUR"
    internet_max_bandwidth_out = 100
    public_ip_assigned         = true
    subnet_id                  = var.subnet

    data_disk {
      disk_type = "CLOUD_PREMIUM"
      disk_size = 50
    }

    enhanced_security_service = false
    enhanced_monitor_service  = false
    user_data                 = "dGVzdA=="
    password                  = "ZZXXccvv1212"
  }

  cluster_deploy_type = "INDEPENDENT_CLUSTER"
}
*/
