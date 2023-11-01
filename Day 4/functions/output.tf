output "ami_value" {
  value = lookup(var.aws_amis, var.aws_region)
}
