
resource "aws_instance" "magento2" {

  ami = "ami-024e6efaf93d85776"
  instance_type = "t2.micro"
  key_name = "aws_access_key"
  subnet_id = "${aws_subnet.prod-pub-1.id}"
  vpc_security_group_ids = ["${aws_security_group.SG-instance.id}"]
  tags = {
    Name = "magento2"
  }
}

resource "aws_instance" "varnish" {

  ami = "ami-024e6efaf93d85776"
  instance_type = "t2.micro"
  key_name = "aws_access_key"
  subnet_id = "${aws_subnet.prod-pub-1.id}"
  vpc_security_group_ids = ["${aws_security_group.SG-instance.id}"]
  tags = {
    Name = "varnish"
  }
}

