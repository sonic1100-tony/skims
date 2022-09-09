############ Public Subnets ############

resource "aws_subnet" "jyp-public-subnet1" {

  depends_on = [
    aws_vpc.jyp-vpc
  ]

  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "10.10.1.0/24"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_public_ip_on_launch                        = "true"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name                                     = "jyp-public-subnet1"
    "kubernetes.io/cluster/jyp-eks-cluster" = "shared"
    "kubernetes.io/role/elb"                 = 1
  }

  tags_all = {
    Name                                     = "jyp-public-subnet1"
    "kubernetes.io/cluster/jyp-eks-cluster" = "shared"
    "kubernetes.io/role/elb"                 = 1
  }

  vpc_id = aws_vpc.jyp-vpc.id
  availability_zone = "ap-northeast-2a"
}



############ Private Subnets ############

resource "aws_subnet" "jyp-private-subnet1" {

  depends_on = [
    aws_vpc.jyp-vpc
  ]

  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "10.10.32.0/24"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name                                     = "jyp-private-subnet1"
    "kubernetes.io/cluster/jyp-eks-cluster" = "shared"
  }

  tags_all = {
    Name                                     = "jyp-private-subnet1"
    "kubernetes.io/cluster/jyp-eks-cluster" = "shared"
  }

  vpc_id = aws_vpc.jyp-vpc.id
  availability_zone = "ap-northeast-2a"
}

resource "aws_subnet" "jyp-private-subnet3" {

  depends_on = [
    aws_vpc.jyp-vpc
  ]

  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "10.10.48.0/24"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name                                     = "jyp-private-subnet3"
    "kubernetes.io/cluster/jyp-eks-cluster" = "shared"
  }

  tags_all = {
    Name                                     = "jyp-private-subnet3"
    "kubernetes.io/cluster/jyp-eks-cluster" = "shared"
  }

  vpc_id = aws_vpc.jyp-vpc.id
  availability_zone = "ap-northeast-2c"
}
