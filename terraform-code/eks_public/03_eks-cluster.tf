data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "skims-s3-tf-state"
    key    = "skims-network/terraform.tfstate"
    region = "ap-northeast-2"
  }
}

resource "aws_eks_cluster" "skims-public-eks-cluster" {

  depends_on = [
    aws_iam_role_policy_attachment.skims-public-iam-policy-eks-cluster,
    aws_iam_role_policy_attachment.skims-public-iam-policy-eks-cluster-vpc,
  ]

  name     = var.cluster-name
  role_arn = aws_iam_role.skims-public-iam-role-eks-cluster.arn
  version = "1.21"

  #enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]

  vpc_config {
    security_group_ids = [data.terraform_remote_state.network.outputs.skims-sg-eks-cluster_id]
    subnet_ids         = [data.terraform_remote_state.network.outputs.subnet_skims_public_subnet01_id, data.terraform_remote_state.network.outputs.subnet_skims_public_subnet02_id]
    endpoint_public_access = true
    endpoint_private_access = true
  }


}