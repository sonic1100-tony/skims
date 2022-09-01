
########## Public Subnet Route Tables ########## 

resource "aws_route_table" "skims-route-table-pub-sub1" {

  depends_on = [
    aws_vpc.skims-vpc,
    aws_internet_gateway.skims-internet-gateway
  ]

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.skims-internet-gateway.id
  }

  tags = {
    Name = "skims-route-table-pub-sub1"
  }

  tags_all = {
    Name = "skims-route-table-pub-sub1"
  }

  vpc_id = aws_vpc.skims-vpc.id
}

resource "aws_route_table" "skims-route-table-pub-sub2" {

  depends_on = [
    aws_vpc.skims-vpc,
    aws_internet_gateway.skims-internet-gateway
  ]

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.skims-internet-gateway.id
  }

  tags = {
    Name = "skims-route-table-pub-sub2"
  }

  tags_all = {
    Name = "skims-route-table-pub-sub2"
  }

  vpc_id = aws_vpc.skims-vpc.id
}

########## Private Subnet Route Tables ########## 

resource "aws_route_table" "skims-route-table-pri-sub1" {

  depends_on = [
    aws_vpc.skims-vpc,
    aws_nat_gateway.skims-nat-gateway
  ]

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.skims-nat-gateway.id
  }

  tags = {
    Name = "skims-route-table-pri-sub1"
  }

  tags_all = {
    Name = "skims-route-table-pri-sub1"
  }

  vpc_id = aws_vpc.skims-vpc.id
}

resource "aws_route_table" "skims-route-table-pri-sub2" {

  depends_on = [
    aws_vpc.skims-vpc,
    aws_nat_gateway.skims-nat-gateway
  ]

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.skims-nat-gateway.id
  }

  tags = {
    Name = "skims-route-table-pri-sub2"
  }

  tags_all = {
    Name = "skims-route-table-pri-sub2"
  }

  vpc_id = aws_vpc.skims-vpc.id
}




########## Public Subnet Route Tables Association ########## 

resource "aws_route_table_association" "skims-route-association-pub-sub1" {
  route_table_id = aws_route_table.skims-route-table-pub-sub1.id
  subnet_id      = aws_subnet.skims-public-subnet-01.id
}

resource "aws_route_table_association" "skims-route-association-pub-sub2" {
  route_table_id = aws_route_table.skims-route-table-pub-sub2.id
  subnet_id      = aws_subnet.skims-public-subnet-02.id
}

########## Private Subnet Route Tables Association ########## 

resource "aws_route_table_association" "skims-route-association-pri-sub1" {
  route_table_id = aws_route_table.skims-route-table-pri-sub1.id
  subnet_id      = aws_subnet.skims-private-subnet-01.id
}

resource "aws_route_table_association" "skims-route-association-pri-sub2" {
  route_table_id = aws_route_table.skims-route-table-pri-sub2.id
  subnet_id      = aws_subnet.skims-private-subnet-02.id
}
