data "local_file" "foo" {
  filename = "${path.module}/demo.txt"
}

#execute above independently by commenting out the data block of the 'aws_instances'
#------------------------------------------------------------------------

data "aws_instances" "foo" {
}