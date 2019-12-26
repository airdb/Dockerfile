resource "aws_instance" "my-test-instance" {
  count         = "1"
  ami           = "ami-00942d7cd4f3ca5c0"
  instance_type = "t2.micro"
}
