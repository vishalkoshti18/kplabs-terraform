variable "boys" {
  type = list(string)
  default = [ "vishal", "shubham", "vivek", "mahesh", "kunal" ]
}

resource "aws_iam_user" "roommate" {
  name = var.boys[count.index]
  path = "/T4-1504/"

  count = 5

}

#to get attributes of all iam users
output "all_name" {
  value = aws_iam_user.roommate[*].arn
}

#to get the atribute related to specific user
output "specific_name" {
  value = aws_iam_user.roommate[0].arn #vishal's arn :)
}