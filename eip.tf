resource "aws_eip" "magento-eip" {

tags = {
    Name = "magento-eip"
  }
}

resource "aws_eip" "varnish-eip" {

tags = {
    Name = "varnish-eip"
  }
}

resource "aws_eip_association" "magento-eip-association" {
  instance_id   = aws_instance.magento2.id
  allocation_id = aws_eip.magento-eip.id
}

resource "aws_eip_association" "varnish-eip-association" {
  instance_id   = aws_instance.varnish.id
  allocation_id = aws_eip.varnish-eip.id
}
