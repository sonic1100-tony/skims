############ Public Subnets ############

resource "aws_subnet" "skims-public-subnet-01" {

  depends_on = [
    aws_vpc.skims-vpc
  ]

  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "10.0.1.0/24"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_public_ip_on_launch                        = "true"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name        = "skims-public-subnet-01"
    "kubernetes.io/cluster/skims-public-eks-cluster" = "shared"
    "kubernetes.io/role/elb"                         = "1"
  }

  vpc_id = aws_vpc.skims-vpc.id
  availability_zone = "ap-northeast-2a"
}

resource "aws_subnet" "skims-public-subnet-02" {

  depends_on = [
    aws_vpc.skims-vpc
  ]

  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "10.0.2.0/24"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_public_ip_on_launch                        = "true"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name        = "skims-public-subnet-02"
    "kubernetes.io/cluster/skims-public-eks-cluster" = "shared"
    "kubernetes.io/role/elb"                         = "1"
  }

  vpc_id = aws_vpc.skims-vpc.id
  availability_zone = "ap-northeast-2c"
}


############ Private Subnets ############

resource "aws_subnet" "skims-private-subnet-01" {

  depends_on = [
    aws_vpc.skims-vpc
  ]

  vpc_id = aws_vpc.skims-vpc.id
  availability_zone = "ap-northeast-2a"
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "10.0.10.0/24"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name                                     = "skims-private-subnet-01"
    "kubernetes.io/cluster/skims-eks-cluster" = "shared"
    "kubernetes.io/role/internal-elb"         = "1"
  }

  tags_all = {
    Name                                      = "skims-private-subnet-01"
    "kubernetes.io/cluster/skims-eks-cluster" = "shared"
    "kubernetes.io/role/internal-elb"         = "1"
  }


}

resource "aws_subnet" "skims-private-subnet-02" {

  depends_on = [
    aws_vpc.skims-vpc
  ]

  vpc_id = aws_vpc.skims-vpc.id
  availability_zone = "ap-northeast-2c"
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "10.0.20.0/24"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name                                      = "skims-private-subnet-02"
    "kubernetes.io/cluster/skims-eks-cluster" = "shared"
    "kubernetes.io/role/internal-elb"         = "1"
  }

   tags_all = {
     Name                                     = "skims-private-subnet-02"
    "kubernetes.io/cluster/skims-eks-cluster" = "shared"
    "kubernetes.io/role/internal-elb"         = "1"
   }


}
