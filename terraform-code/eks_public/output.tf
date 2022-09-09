# ### VPC ###

# output "vpc_skims_vpc_id" {
#   value = aws_vpc.skims-vpc.id
# }

# output "vpc_skims_vpc_cidr_range" {
#   value = aws_vpc.skims-vpc.cidr_block
# }

### eks cluster ###
output "skims-public-eks-cluster_id" {
  value = aws_eks_cluster.skims-public-eks-cluster
}

output "skims-eks-nodegroup_id" {
  value = aws_eks_node_group.skims-public-eks-nodegroup.id
}