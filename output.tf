/*data "aws_subnets" "my-pub-sub" {
  filter {
    name   = "vpc-id"
   # values = [aws_vpc.my-vpc.my-vpc_id]
  }
}*/

data "aws_subnet" "my-pub-sub" {
  for_each = toset(data.aws_subnets.my-pub-sub.ids)
  id       = each.value
}

output "subnet_cidr_blocks" {
  value = [for s in data.aws_subnet.my-pub-sub : s.cidr_block]
}
