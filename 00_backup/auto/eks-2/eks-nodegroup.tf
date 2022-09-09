resource "aws_eks_node_group" "jyp2-eks-nodegroup" {
  cluster_name    = aws_eks_cluster.jyp2-eks-cluster.name
  node_group_name = "jyp2-eks-nodegroup"
  node_role_arn   = aws_iam_role.jyp2-iam-role-eks-nodegroup.arn
  subnet_ids      = [data.terraform_remote_state.network.outputs.subnet_jyp_private_subnet01_id, data.terraform_remote_state.network.outputs.subnet_jyp_private_subnet02_id]
  instance_types = ["t2.micro"]
  disk_size = 20
  

  labels = {
    "role" = "eks-nodegroup"
  }

  scaling_config {
    desired_size = 2
    min_size     = 1
    max_size     = 3
  }

  depends_on = [
    aws_iam_role_policy_attachment.jyp2-iam-policy-eks-nodegroup,
    aws_iam_role_policy_attachment.jyp2-iam-policy-eks-nodegroup-cni,
    aws_iam_role_policy_attachment.jyp2-iam-policy-eks-nodegroup-ecr,
  ]

  tags = {
    "Name" = "${aws_eks_cluster.jyp2-eks-cluster.name}-worker-node"
  }
}
