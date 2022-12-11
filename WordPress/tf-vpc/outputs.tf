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
output "private_az" {
  value = aws_subnet.sn-private.availability_zone
}