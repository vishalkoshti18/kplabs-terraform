# resource "local_file" "foo" {
#   content  = "Foo!!"
#   filename = "${path.module}/foo.txt"
# }

removed {
  from = local_file.foo
  lifecycle {
    destroy = false
  }
}
