source "amazon-ebs" "ubuntu" {
  ami_name      = "ansible-test-arole-git-{{timestamp}}"
  instance_type = "t2.micro"
  region        = "us-east-1"
  vpc_id = "vpc_xxx"
  subnet_id = "subnet-xxx"
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/*ubuntu-focal-20.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
  ssh_username = "ubuntu"
  ssh_interface = "public_ip"
  associate_public_ip_address = true
}

build {
  name    = "ansible-test-arole-git"

  sources = [
    "source.amazon-ebs.ubuntu"
  ]
  provisioner "shell" {
    script = "install_ubuntu_desktop.sh"
}
}
