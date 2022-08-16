
########## Public Subnet Route Tables ########## 

resource "aws_route_table" "jyp-route-table-pub-sub1" {

  depends_on = [
    aws_vpc.jyp-vpc,
    aws_internet_gateway.jyp-internet-gateway
  ]

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.jyp-internet-gateway.id
  }

  tags = {
    Name = "jyp-route-table-pub-sub1"
  }

  tags_all = {
    Name = "jyp-route-table-pub-sub1"
  }

  vpc_id = aws_vpc.jyp-vpc.id
}


########## Private Subnet Route Tables ########## 

resource "aws_route_table" "jyp-route-table-pri-sub1" {

  depends_on = [
    aws_vpc.jyp-vpc,
    aws_nat_gateway.jyp-nat-gateway
  ]

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.jyp-nat-gateway.id
  }

  tags = {
    Name = "jyp-route-table-pri-sub1"
  }

  tags_all = {
    Name = "jyp-route-table-pri-sub1"
  }

  vpc_id = aws_vpc.jyp-vpc.id
}

resource "aws_route_table" "jyp-route-table-pri-sub3" {

  depends_on = [
    aws_vpc.jyp-vpc,
    aws_nat_gateway.jyp-nat-gateway
  ]

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.jyp-nat-gateway.id
  }

  tags = {
    Name = "jyp-route-table-pri-sub3"
  }

  tags_all = {
    Name = "jyp-route-table-pri-sub3"
  }

  vpc_id = aws_vpc.jyp-vpc.id
}




########## Public Subnet Route Tables Association ########## 

resource "aws_route_table_association" "jyp-route-association-pub-sub1" {
  route_table_id = aws_route_table.jyp-route-table-pub-sub1.id
  subnet_id      = aws_subnet.jyp-public-subnet1.id
}


########## Private Subnet Route Tables Association ########## 

resource "aws_route_table_association" "jyp-route-association-pri-sub1" {
  route_table_id = aws_route_table.jyp-route-table-pri-sub1.id
  subnet_id      = aws_subnet.jyp-private-subnet1.id
}

resource "aws_route_table_association" "jyp-route-association-pri-sub3" {
  route_table_id = aws_route_table.jyp-route-table-pri-sub3.id
  subnet_id      = aws_subnet.jyp-private-subnet3.id
}