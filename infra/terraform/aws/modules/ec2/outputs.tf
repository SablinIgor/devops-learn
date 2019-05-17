output "server-ip" {
  value = "${aws_eip.devops-eip.*.public_ip}"  
}
output "server-id" {
  value = "${aws_instance.ec2-instance.*.id}"  
}
