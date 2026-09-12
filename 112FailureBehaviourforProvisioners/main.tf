resource "local_file" "foo" {
  content  = "foo!"
  filename = "${path.module}/foo.bar"

  provisioner "local-exec" {
    command = "/usr/bin/echo Hello There >>>> echo.txt"
    on_failure = continue
  }
}