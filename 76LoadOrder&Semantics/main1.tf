    resource "local_file" "foo1" {
    content  = "Siuuu!"
    filename = "${path.module}/Siuu.bar"
    }