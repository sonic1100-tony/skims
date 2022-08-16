resource "aws_eip" "jyp-elastic-ip" {
  network_border_group = "ap-northeast-2"
  public_ipv4_pool     = "amazon"

  tags = {
    Name        = "jyp-elastic-ip"
  }

  tags_all = {
    Name        = "jyp-elastic-ip"
  }

  vpc = true
}
