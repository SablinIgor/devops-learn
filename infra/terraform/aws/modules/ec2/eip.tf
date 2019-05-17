resource "aws_eip" "devops-eip" {
  count = "${var.servers}"
  instance    = "${element(aws_instance.ec2-instance.*.id, count.index)}"  
}
