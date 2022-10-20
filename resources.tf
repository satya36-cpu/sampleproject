resource "aws_vpc" "my_vpc" {
    cidr_block = "192.168.0.0/16"
    tags = {
        Name ="myvpc"
    }
}
resource "aws_subnet" "first_subnet" {
    vpc_id = aws_vpc.my_vpc.id # implicit dependency
    cidr_block = "192.168.0.0/24"

    tags = {
        "Name" ="fast subnet"
    }
   
}
resource "aws_subnet" "second_subnet" {
    vpc_id = aws_vpc.my_vpc.id # implicit dependency
    cidr_block = "192.168.1.0/24"
    
    tags = {
      "Name" ="second subnet"
    }
    depends_on = [
      aws_subnet.first_subnet
    ]
   
}
resource "aws_subnet" "third_subnet" {
    vpc_id = aws_vpc.my_vpc.id # implicit dependency
    cidr_block = "192.168.2.0/24"
    
    tags = {
      "Name" ="third subnet"
    }
    # external dependency
    depends_on = [
      aws_subnet.second_subnet
    ]
   
}
resource "aws_subnet" "fourth_subnet" {
    vpc_id = aws_vpc.my_vpc.id # implicit dependency
    cidr_block = "192.168.3.0/24"
    
    tags = {
      "Name" ="fourth subnet"
    }
    # external dependency
    depends_on = [
      aws_subnet.third_subnet
    ]
   
}
resource "aws_subnet" "fifth_subnet" {
    vpc_id = aws_vpc.my_vpc.id # implicit dependency
    cidr_block = "192.168.4.0/24"
    
    tags = {
      "Name" ="fifth subnet"
    }
    # external dependency
    depends_on = [
      aws_subnet.fourth_subnet
    ]
   
}
resource "aws_subnet" "sixth_subnet" {
    vpc_id = aws_vpc.my_vpc.id # implicit dependency
    cidr_block = "192.168.5.0/24"
    
    tags = {
      "Name" ="sixth subnet"
    }
    # external dependency
    depends_on = [
      aws_subnet.fifth_subnet
    ]
   
}