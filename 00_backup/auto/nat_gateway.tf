resource "aws_nat_gateway" "jyp-nat-gateway" {

  depends_on = [
    aws_eip.jyp-elastic-ip
  ]

  allocation_id     = aws_eip.jyp-elastic-ip.id
  subnet_id         = aws_subnet.jyp-public-subnet1.id
  connectivity_type = "public"

  tags = {
    Name        = "jyp-nat-gateway"
  }

  tags_all = {
    Name        = "jyp-nat-gateway"
  }

}
