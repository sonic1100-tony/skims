########### EKS Security Group ###########

resource "aws_security_group" "skims-sg-eks-cluster" {
  name        = "skims-sg-eks-cluster"
  description = "security_group for skims-eks-cluster"
  vpc_id      = aws_vpc.skims-vpc.id

  tags = {
    Name = "skims-sg-eks-cluster"
  }
}

resource "aws_security_group_rule" "skims-sg-eks-cluster-ingress" {

  security_group_id = aws_security_group.skims-sg-eks-cluster.id
  type              = "ingress"
  description       = "ingress security_group_rule for skims-eks-cluster"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "skims-sg-eks-cluster-egress" {

  security_group_id = aws_security_group.skims-sg-eks-cluster.id
  type              = "egress"
  description       = "egress security_group_rule for skims-eks-cluster"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

########### Bastion (EC2 Instance) Security Group ###########

resource "aws_security_group" "skims-sg-bastion" {

  name   = "skims-sg-bastion"
  vpc_id = aws_vpc.skims-vpc.id

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "ingress security_group_rule for bastion"
    from_port   = "22"
    protocol    = "tcp"
    self        = "false"
    to_port     = "22"
  }

    ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "ingress security_group_rule for bastion"
    from_port   = "8080"
    protocol    = "tcp"
    self        = "false"
    to_port     = "8080"
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "egress security_group_rule for bastion"
    from_port   = "0"
    protocol    = "tcp"
    self        = "false"
    to_port     = "65535"
  }

  tags = {
    Name = "skims-sg-bastion"
  }
}

########### Bastion (RDS) Security Group ###########

resource "aws_security_group" "skims-sg-rds" {

  name   = "skims-sg-rds"
  vpc_id = aws_vpc.skims-vpc.id

  ingress {
    cidr_blocks = ["10.0.0.0/16"]
    description = "ingress security_group_rule for rds"
    from_port   = "3306"
    protocol    = "tcp"
    self        = "false"
    to_port     = "3306"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "ingress security_group_rule for ssh"
    from_port   = "22"
    protocol    = "tcp"
    self        = "false"
    to_port     = "22"
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "egress security_group_rule for rds"
    from_port   = "0"
    protocol    = "tcp"
    self        = "false"
    to_port     = "65535"
  }

  tags = {
    Name = "skims-sg-rds"
  }
}