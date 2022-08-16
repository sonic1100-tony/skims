resource "aws_internet_gateway" "jyp-internet-gateway" {

  depends_on = [
    aws_vpc.jyp-vpc
  ]

  vpc_id = aws_vpc.jyp-vpc.id

  tags = {
    Name = "jyp-igw"
  }
}