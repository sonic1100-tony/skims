resource "aws_eip" "skims-elastic-ip" {
  network_border_group = "ap-northeast-2"
  public_ipv4_pool     = "amazon"

  tags = {
    Name        = "skims-elastic-ip"
  }

  tags_all = {
    Name        = "skims-elastic-ip"
  }

  vpc = true
}
