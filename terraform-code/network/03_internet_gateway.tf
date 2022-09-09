resource "aws_internet_gateway" "skims-internet-gateway" {

  depends_on = [
    aws_vpc.skims-vpc
  ]

  vpc_id = aws_vpc.skims-vpc.id

  tags = {
    Name = "skims-igw"
  }
}