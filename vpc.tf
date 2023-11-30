# create vpc
resource "aws_vpc" "my-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "vpc"
  }
}

#create subents
resource "aws_subnet" "my-pub-sub" {
  vpc_id            = aws_vpc.my-vpc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "ap-south-1a"
  tags = {
    Name = "pub-subent"
  }
}
resource "aws_subnet" "my-pvt-sub" {
  vpc_id            = aws_vpc.my-vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-south-1b"

  tags = {
    Name = "pvt-subent"
  }
}
#create interent gatway
resource "aws_internet_gateway" "my-ig" {
  vpc_id = aws_vpc.my-vpc.id

  tags = {
    Name = "ig"
  }
}
#create a route table
resource "aws_route_table" "my-pub-rt" {
  vpc_id = aws_vpc.my-vpc.id

  route = []

  tags = {
    Name = "pub-rt"
  }
}
resource "aws_route_table" "my-pvt-rt" {
  vpc_id = aws_vpc.my-vpc.id

  route = []

  tags = {
    Name = "pvt-rt"
  }
}
# add the route table assocaition
resource "aws_route_table_association" "rt-pub" {
  subnet_id      = aws_subnet.my-pub-sub.id
  route_table_id = aws_route_table.my-pub-rt.id
}
resource "aws_route_table_association" "rt-pvt" {
  subnet_id      = aws_subnet.my-pvt-sub.id
  route_table_id = aws_route_table.my-pvt-rt.id
}
#create a Nat getway 
/*resource "aws_nat_gateway" "my-Nat" {
 subnet_id = aws_subnet.my-pub-sub.id
 allocation_id = aws_security_group.my-sg.id
 
  tags = {
    name="nat"
  }
}*/