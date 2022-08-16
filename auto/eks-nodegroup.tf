# resource "aws_eks_node_group" "jyp-eks-nodegroup" {
#   cluster_name    = aws_eks_cluster.jyp-eks-cluster.name
#   node_group_name = "jyp-eks-nodegroup"
#   node_role_arn   = aws_iam_role.jyp-iam-role-eks-nodegroup.arn
#   subnet_ids      = [aws_subnet.jyp-private-subnet1.id, aws_subnet.jyp-private-subnet3.id]
#   instance_types = ["t2.micro"]
#   disk_size = 20

#   labels = {
#     "role" = "eks-nodegroup"
#   }

#   scaling_config {
#     desired_size = 2
#     min_size     = 1
#     max_size     = 3
#   }

#   depends_on = [
#     aws_iam_role_policy_attachment.jyp-iam-policy-eks-nodegroup,
#     aws_iam_role_policy_attachment.jyp-iam-policy-eks-nodegroup-cni,
#     aws_iam_role_policy_attachment.jyp-iam-policy-eks-nodegroup-ecr,
#   ]

#   tags = {
#     "Name" = "${aws_eks_cluster.jyp-eks-cluster.name}-worker-node"
#   }
# }
