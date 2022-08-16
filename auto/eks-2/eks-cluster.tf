data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "jyp-s3-tf-state"
    key    = "terraform.tfstate"
    region = "ap-northeast-2"
  }
}


resource "aws_eks_cluster" "jyp2-eks-cluster" {

  depends_on = [
    aws_iam_role_policy_attachment.jyp2-iam-policy-eks-cluster,
    aws_iam_role_policy_attachment.jyp2-iam-policy-eks-cluster-vpc,
  ]

  name     = var.cluster-name
  role_arn = aws_iam_role.jyp2-iam-role-eks-cluster.arn
  version = "1.21"

  enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]

  vpc_config {
    security_group_ids = [data.terraform_remote_state.network.outputs.jyp-sg-eks-cluster_id]
    subnet_ids         = [data.terraform_remote_state.network.outputs.subnet_jyp_private_subnet01_id, data.terraform_remote_state.network.outputs.subnet_jyp_private_subnet02_id]
    endpoint_public_access = true
    endpoint_private_access = true
  }


}