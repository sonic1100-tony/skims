### VPC ###

output "vpc_skims_vpc_id" {
  value = aws_vpc.skims-vpc.id
}

output "vpc_skims_vpc_cidr_range" {
  value = aws_vpc.skims-vpc.cidr_block
}


### Subnet ###
output "subnet_skims_private_subnet01_id" {
  value = aws_subnet.skims-private-subnet-01.id
}

output "subnet_skims_private_subnet02_id" {
  value = aws_subnet.skims-private-subnet-02.id
}

output "subnet_skims_public-subnet01_id" {
  value = aws_subnet.skims-public-subnet-01.id
}

### Internet Gateway###
output "skims_igw_id" {
  value = aws_internet_gateway.skims-internet-gateway.id
}



### Route Tables ###
output "skims-route-table-pub-sub1_id" {
  value = aws_route_table.skims-route-table-pub-sub1.id
}

output "skims-route-table-pri-sub1_id" {
  value = aws_route_table.skims-route-table-pri-sub1.id
}

output "skims-route-table-pri-sub2_id" {
  value = aws_route_table.skims-route-table-pri-sub2.id
}


### Security Groups ###
output "skims-sg-eks-cluster_id" {
  value = aws_security_group.skims-sg-eks-cluster.id
}

output "skims-sg-bastion_id" {
  value = aws_security_group.skims-sg-bastion.id
}

output "skims-sg-rds_id" {
  value = aws_security_group.skims-sg-rds.id
}


### Nat Gateway ###
output "skims-nat-gateway_id" {
  value = aws_nat_gateway.skims-nat-gateway.id
}

### EIP ###
output "skims-elastic-ip_id" {
  value = aws_eip.skims-elastic-ip.id
}