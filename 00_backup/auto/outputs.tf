### VPC ###

output "vpc_jyp_vpc_id" {
  value = aws_vpc.jyp-vpc.id
}

output "vpc_jyp_vpc_cidr_range" {
  value = aws_vpc.jyp-vpc.cidr_block
}


### Subnet ###
output "subnet_jyp_private_subnet01_id" {
  value = aws_subnet.jyp-private-subnet1.id
}

output "subnet_jyp_private_subnet02_id" {
  value = aws_subnet.jyp-private-subnet3.id
}

output "subnet_jyp_public-subnet01_id" {
  value = aws_subnet.jyp-public-subnet1.id
}

### Internet Gateway###
output "jyp_igw_id" {
  value = aws_internet_gateway.jyp-internet-gateway.id
}



### Route Tables ###
output "jyp-route-table-pub-sub1_id" {
  value = aws_route_table.jyp-route-table-pub-sub1.id
}

output "jyp-route-table-pri-sub1_id" {
  value = aws_route_table.jyp-route-table-pri-sub1.id
}

output "jyp-route-table-pri-sub3_id" {
  value = aws_route_table.jyp-route-table-pri-sub3.id
}


### Security Groups ###
output "jyp-sg-eks-cluster_id" {
  value = aws_security_group.jyp-sg-eks-cluster.id
}

output "jyp-sg-bastion_id" {
  value = aws_security_group.jyp-sg-bastion.id
}


### Nat Gateway ###
output "jyp-nat-gateway_id" {
  value = aws_nat_gateway.jyp-nat-gateway.id
}

### EIP ###
output "jyp-elastic-ip_id" {
  value = aws_eip.jyp-elastic-ip.id
}

## role ###
output "jyp-iam-role-eks-cluster_id" {
  value = aws_iam_role.jyp-iam-role-eks-cluster.id
}

output "jyp-iam-role-eks-nodegroup_arn" {
  value = aws_iam_role.jyp-iam-role-eks-nodegroup.arn
}

output "jyp-iam-role-eks-nodegroup_id" {
  value = aws_iam_role.jyp-iam-role-eks-nodegroup.id
}