# resource "local_file" "foo" {
#         content  = "foo!"
#   filename = "${path.module}/foo.bar"
# }

variable "my-map" {
  type        = map(any)
  description = "this is a map variable"
  default = {
    "Name" = "Vishal"
    "Age"  = "28"
  }
}

variable "my-object" {
  type = object({
    Name = string
    Age  = number
  })

  default = {
    Name = "Vishal"
    Age = 28
  }
}

output "map-val" {
  value = var.my-map
}

output "my-object" {
  value = var.my-object
}