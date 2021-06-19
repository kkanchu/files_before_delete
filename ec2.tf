#resource "aws_volume_attachment" "mercury_ingestion-prod" {
 # device_name = "/dev/sdb"
 # device_name = "/dev/sda1" #Allocation of storage to windows "C" drive
  #volume_id   = aws_ebs_volume.ingestion-prod.id
  #instance_id = aws_instance.ingestion1-prod.id
#}

#resource "aws_ebs_volume" "ingestion-prod" {
 # availability_zone = "us-east-1a"
  #size              = 120 
#}



resource "aws_instance" "web-1" {
    ami = var.imagename
    #ami = "ami-0d857ff0f5fc4e03b"
    #ami = "${data.aws_ami.my_ami.id}"
    availability_zone = "eu-central-1a"
    instance_type = "t2.micro"
    key_name = "chilakakey1"
    subnet_id = "${aws_subnet.subnet-private.id}"
    vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]
#    associate_private_ip_address = true	
    tags = {
        Name = "Ingestion1-prod"
        Env = "Prod"
        Owner = "Aravind"
	CostCenter = "ABCD"
    }
}
