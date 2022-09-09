resource "aws_nat_gateway" "skims-nat-gateway" {

  depends_on = [
    aws_eip.skims-elastic-ip
  ]

  allocation_id     = aws_eip.skims-elastic-ip.id
  subnet_id         = aws_subnet.skims-public-subnet-01.id
  connectivity_type = "public"

  tags = {
    Name        = "skims-nat-gateway"
  }

  tags_all = {
    Name        = "skims-nat-gateway"
  }

}
