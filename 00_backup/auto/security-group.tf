########### EKS Security Group ###########

resource "aws_security_group" "jyp-sg-eks-cluster" {
  name        = "jyp-sg-eks-cluster"
  description = "security_group for jyp-eks-cluster"
  vpc_id      = aws_vpc.jyp-vpc.id

  tags = {
    Name = "jyp-sg-eks-cluster"
  }
}

resource "aws_security_group_rule" "jyp-sg-eks-cluster-ingress" {

  security_group_id = aws_security_group.jyp-sg-eks-cluster.id
  type              = "ingress"
  description       = "ingress security_group_rule for jyp-eks-cluster"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "jyp-sg-eks-cluster-egress" {

  security_group_id = aws_security_group.jyp-sg-eks-cluster.id
  type              = "egress"
  description       = "egress security_group_rule for jyp-eks-cluster"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

########### Bastion (EC2 Instance) Security Group ###########

resource "aws_security_group" "jyp-sg-bastion" {

  name   = "jyp-sg-bastion"
  vpc_id = aws_vpc.jyp-vpc.id

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "ingress security_group_rule for bastion"
    from_port   = "22"
    protocol    = "tcp"
    self        = "false"
    to_port     = "22"
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
    Name = "jyp-sg-bastion"
  }
}
