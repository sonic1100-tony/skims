resource "aws_instance" "skims-ec2-jenkins" {

  ami                         = "ami-0444dd1f48b76275b"
  associate_public_ip_address = "false"
  availability_zone           = "ap-northeast-2a"

  # iam_instance_profile        = aws_iam_instance_profile.skims-ec2-instance-profile.name
  key_name                    = "sk-rds-key"

  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }

  credit_specification {
    cpu_credits = "standard"
  }

  disable_api_termination = "false"
  ebs_optimized           = "false"

  enclave_options {
    enabled = "false"
  }

  get_password_data                    = "false"
  hibernation                          = "false"

  instance_initiated_shutdown_behavior = "stop"
  instance_type                        = "t3a.medium"
  ipv6_address_count                   = "0"
  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = "1"
    http_tokens                 = "optional"
  }

  monitoring = "false"

  root_block_device {
    delete_on_termination = "true"
    encrypted             = "false"

    tags = {
      Name        = "skims-ec2-jenkins-ebs"
    }

    volume_size = "50"
    volume_type = "gp2"
  }

  source_dest_check = "true"


  tags = {
    Name        = "skims-ec2-jenkins"
  }

  tags_all = {
    Name        = "skims-ec2-jenkins"
  }

  tenancy       = "default"
  
  #vpc_id        = data.terraform_remote_state.network.outputs.aws_vpc.vpc_skims_vpc_id
  subnet_id     = data.terraform_remote_state.network.outputs.subnet_skims_private_subnet01_id
  vpc_security_group_ids = [data.terraform_remote_state.network.outputs.skims-sg-bastion_id]

}

