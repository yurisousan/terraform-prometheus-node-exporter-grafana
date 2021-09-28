resource "aws_eip" "lb" {
  instance = aws_instance.server[0].id
  vpc      = true
}