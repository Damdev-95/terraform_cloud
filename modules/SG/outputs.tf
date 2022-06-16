output "ALB-sg" {
  value = aws_security_group.Project18["ext-alb-sg"].id
}


output "IALB-sg" {
  value = aws_security_group.Project18["int-alb-sg"].id
}


output "bastion-sg" {
  value = aws_security_group.Project18["bastion-sg"].id
}


output "nginx-sg" {
  value = aws_security_group.Project18["nginx-sg"].id
}


output "web-sg" {
  value = aws_security_group.Project18["webserver-sg"].id
}


output "datalayer-sg" {
  value = aws_security_group.Project18["datalayer-sg"].id
}