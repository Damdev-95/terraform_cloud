resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.project_18.id
  tags = merge(
    var.tags,
    {
      Name = format("%s-%s-%s!",var.name, aws_vpc.project_18.id, "IG")
    },
  )
}
