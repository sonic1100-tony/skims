resource "aws_eks_node_group" "skims-public-eks-nodegroup" {
  cluster_name    = aws_eks_cluster.skims-public-eks-cluster.name
  # name            = "skims-public-worker-node"
  node_group_name = "skims-public-eks-nodegroup"
  node_role_arn   = aws_iam_role.skims-public-iam-role-eks-nodegroup.arn
  subnet_ids      = [data.terraform_remote_state.network.outputs.subnet_skims_public_subnet01_id, data.terraform_remote_state.network.outputs.subnet_skims_public_subnet02_id]
  instance_types = ["t3.small"]
  disk_size = 20

  labels = {
    "role" = "eks-nodegroup"
  }

  scaling_config {
    desired_size = 2
    min_size     = 1
    max_size     = 5
  }

  depends_on = [
    aws_iam_role_policy_attachment.skims-public-iam-policy-eks-nodegroup,
    aws_iam_role_policy_attachment.skims-public-iam-policy-eks-nodegroup-cni,
    aws_iam_role_policy_attachment.skims-public-iam-policy-eks-nodegroup-ecr,
  ]

  remote_access {
    source_security_group_ids = [data.terraform_remote_state.network.outputs.skims-sg-eks-cluster_id]
    ec2_ssh_key               = "skims-eks-key"
  }

  tags = {
   Name = "${aws_eks_cluster.skims-public-eks-cluster.name}-worker-node"
  }


}
