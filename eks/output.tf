# ### VPC ###

# output "vpc_skims_vpc_id" {
#   value = aws_vpc.skims-vpc.id
# }

# output "vpc_skims_vpc_cidr_range" {
#   value = aws_vpc.skims-vpc.cidr_block
# }

### eks cluster ###
output "skims-eks-cluster_id" {
  value = aws_eks_cluster.skims-eks-cluster.id
}

output "skims-eks-nodegroup_id" {
  value = aws_eks_node_group.skims-eks-nodegroup.id
}