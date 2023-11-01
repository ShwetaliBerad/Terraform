# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "i-0fbedf1861852e6cb"
resource "aws_instance" "example" {
  ami                                  = "ami-067d1e60475437da2"
  associate_public_ip_address          = true
  availability_zone                    = "us-east-1d"
  cpu_core_count                       = 1
  cpu_threads_per_core                 = 1
  disable_api_termination              = false
  ebs_optimized                        = false
  get_password_data                    = false
  hibernation                          = false
  host_id                              = null
  iam_instance_profile                 = null
  instance_initiated_shutdown_behavior = "stop"
  instance_type                        = "t2.micro"
  ipv6_address_count                   = 0
  ipv6_addresses                       = []
  key_name                             = "myKey"
  monitoring                           = false
  placement_group                      = null
  placement_partition_number           = null
  private_ip                           = "172.31.38.111"
  secondary_private_ips                = []
  security_groups                      = ["launch-wizard-3"]
  source_dest_check                    = true
  subnet_id                            = "subnet-0ce87e46e842c2ac4"
  tags = {
    Name = "MyVM-test"
  }
  tags_all = {
    Name = "MyVM-test"
  }
  tenancy                = "default"
  user_data              = null
  user_data_base64       = null
  volume_tags            = null
  vpc_security_group_ids = ["sg-02c6f3a46dc7ccea8"]
  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }
  credit_specification {
    cpu_credits = "standard"
  }
  enclave_options {
    enabled = false
  }
  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = 2
    http_tokens                 = "required"
    instance_metadata_tags      = "disabled"
  }
  root_block_device {
    delete_on_termination = true
    encrypted             = false
    iops                  = 3000
    kms_key_id            = null
    tags                  = {}
    throughput            = 125
    volume_size           = 8
    volume_type           = "gp3"
  }
  timeouts {
    create = null
    delete = null
    update = null
  }
}
