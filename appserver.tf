# -----------------
# key pair
# -----------------

resource "aws_key_pair" "keypair" {
  key_name   = "${var.project}-${var.envirnment}-keypair"
  public_key = file("./src/tastylog-dev-keypair.pub")

  tags = {
    Name    = "${var.project}-${var.envirnment}-keypair"
    Project = var.project
    Env     = var.envirnment
  }

}

# -----------------
# ec2 instance
# -----------------


resource "aws_instance" "app_server" {
  ami           = data.aws_ami.app.id
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet_1a.id
  #associate_public_ip_address = 
  vpc_security_group_ids = [
    aws_security_group.app_sg.id,
    aws_security_group.opmng_sg.id
  ]
  key_name = aws_key_pair.keypair.key_name

  tags = {
    Name    = "${var.project}-${var.envirnment}-ec2"
    Project = var.project
    Env     = var.envirnment
    Type    = "app"
  }

}