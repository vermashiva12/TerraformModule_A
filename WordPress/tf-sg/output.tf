output "sgID_web" {

  value = aws_security_group.aebGroup.id
}
output "sgID_dbGroup" {
    value = aws_security_group.dbGroup.id
  
}