resource "aws_instance" "ec2-instance" {
  ami             = "ami-0ebb3a801d5fb8b9b"
  instance_type   = "${var.instance_type}"
  key_name        = "${var.key_pair}"

  count = "${var.servers}"

  security_groups = ["${var.security_groups}"]

  tags {
    Name = "${var.name}-${count.index}"
  }
}
