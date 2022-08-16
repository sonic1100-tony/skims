### EC2 ###

output "skims-ec2-bastion" {
  description = "instance_id"
  value = aws_instance.skims-ec2-bastion.id
}
