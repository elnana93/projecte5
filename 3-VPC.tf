
# this  makes  vpc.id which is aws_vpc.app1.id
resource "aws_vpc" "app1" {
  cidr_block = "10.50.0.0/16"

 tags = {
    Project     = "ProjectE5"
    Environment = "Dev"
    Owner       = "App1"
  }
  

}