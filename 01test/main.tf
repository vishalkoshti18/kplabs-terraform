# resource "local_file" "foo" {
#         content  = "foo!"
#   filename = "${path.module}/foo.bar"
# }

variable "my-map" {
  type = map(number)
  description = "this is a map variable"
  default = {
    "Name" = "666"
    "Age" = "32"
  }
}

output "map-val" {
  value = var.my-map
}