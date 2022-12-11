output "vpcIDMain" {
  value = aws_vpc.VPC-lab4.id
}
output "publicsb" {
  value = aws_subnet.sn-pb.id
}
output "privatesb" {
  value = aws_subnet.sn-private.id
}
output "public_az" {
  value = aws_subnet.sn-pb.availability_zone
}
output "publicRDS" {
  value = aws_db_subnet_group.rdsGroup.name
  
}
