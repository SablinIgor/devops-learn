output "allow_ssh" {
  value = "${aws_security_group.allow_ssh.name}"
}
output "allow_outbound" {
  value = "${aws_security_group.allow_outbound.name}"
}
