resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.solar-vpc.id
    tags = {
      Name="${var.cluster_name}-igw"
    }
}
