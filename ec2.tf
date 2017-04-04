#------------------------------------------#
# AWS EC2 Configuration
#------------------------------------------#

#---------------Private Subnet-------------#
resource "aws_instance" "Core" {
  count = "2"
  ami = "ami-5ec1673e"
  instance_type = "r3.2xlarge"
  subnet_id="subnet-10f76a66"
  security_groups = ["sg-a22176c4"]
  key_name = "atsp-preprod-pge"

  user_data = <<-EOF
              #!/bin/bash
              #Update pakage
              sudo yum update -y
              #Installing Docker
              sudo yum install -y docker
              sudo service docker start
              sleep 3
              #install rancher agent
              sudo docker run -e CATTLE_HOST_LABELS='services=core'  -d --privileged -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/rancher:/var/lib/rancher rancher/agent:v1.0.2 http://[Rancher-Server-IP]:8080/v1/scripts/47746910A163C2129ACF:1484154000000:bNAhx48cEY6Bz2xp9e8dEcTB2zU
              EOF

  root_block_device {
    volume_type = "gp2"
    volume_size = "200"
    delete_on_termination = "true"
   }
      tags {
        Name = "PGE-Dev-Core"
        Deployment = "Dev"
        Component = "Core"
        Project = "PGE"
    }
  lifecycle {
    create_before_destroy = true
  }
}
resource "aws_instance" "NonCore" {
  count = "2"
  ami = "ami-5ec1673e"
  instance_type = "r3.2xlarge"
  subnet_id="subnet-10f76a66"
  security_groups = ["sg-a22176c4"]
  key_name = "atsp-preprod-pge"

  user_data = <<-EOF
              #!/bin/bash
              #Update pakage
              sudo yum update -y
              #Installing Docker
              sudo yum install -y docker
              sudo service docker start
              sleep 3
              #install rancher agent
              sudo docker run -e CATTLE_HOST_LABELS='services=noncore'  -d --privileged -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/rancher:/var/lib/rancher rancher/agent:v1.0.2 http://[Rancher-Server-IP]:8080/v1/scripts/47746910A163C2129ACF:1484154000000:bNAhx48cEY6Bz2xp9e8dEcTB2zU
              EOF

  root_block_device {
    volume_type = "gp2"
    volume_size = "200"
    delete_on_termination = "true"
   }
      tags {
        Name = "PGE-Dev-NoneCore"
        Deployment = "Dev"
        Component = "NonCore"
        Project = "PGE"
    }
  lifecycle {
    create_before_destroy = true
  }
}
resource "aws_instance" "Kafka" {
  count = "3"
  ami = "ami-5ec1673e"
  instance_type = "m4.xlarge"
  subnet_id="subnet-10f76a66"
  security_groups = ["sg-a22176c4"]
  key_name = "atsp-preprod-pge"

  user_data = <<-EOF
              #!/bin/bash
              #Update pakage
              sudo yum update -y
              #Installing Docker
              sudo yum install -y docker
              sudo service docker start
              sleep 3
              #install rancher agent
              sudo docker run -e CATTLE_HOST_LABELS='services=kafka'  -d --privileged -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/rancher:/var/lib/rancher rancher/agent:v1.0.2 http://[Rancher-Server-IP]:8080/v1/scripts/47746910A163C2129ACF:1484154000000:bNAhx48cEY6Bz2xp9e8dEcTB2zU
              EOF

  root_block_device {
    volume_type = "gp2"
    volume_size = "200"
    delete_on_termination = "true"
   }
      tags {
        Name = "PGE-Dev-Kafka"
        Deployment = "Dev"
        Component = "Kafka"
        Project = "PGE"
    }
  lifecycle {
    create_before_destroy = true
  }
}
resource "aws_instance" "MQTT" {
  count = "3"
  ami = "ami-5ec1673e"
  instance_type = "m4.xlarge"
  subnet_id="subnet-10f76a66"
  security_groups = ["sg-a22176c4"]
  key_name = "atsp-preprod-pge"

  user_data = <<-EOF
              #!/bin/bash
              #Update pakage
              sudo yum update -y
              #Installing Docker
              sudo yum install -y docker
              sudo service docker start
              sleep 3
              #install rancher agent
              sudo docker run -e CATTLE_HOST_LABELS='services=mqtt'  -d --privileged -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/rancher:/var/lib/rancher rancher/agent:v1.0.2 http://[Rancher-Server-IP]:8080/v1/scripts/47746910A163C2129ACF:1484154000000:bNAhx48cEY6Bz2xp9e8dEcTB2zU
              EOF

  root_block_device {
    volume_type = "gp2"
    volume_size = "200"
    delete_on_termination = "true"
   }
      tags {
        Name = "PGE-Dev-MQTT"
        Deployment = "Dev"
        Component = "MQTT"
        Project = "PGE"
    }
  lifecycle {
    create_before_destroy = true
  }
}
resource "aws_instance" "Redis" {
  count = "3"
  ami = "ami-5ec1673e"
  instance_type = "m4.xlarge"
  subnet_id="subnet-10f76a66"
  security_groups = ["sg-a22176c4"]
  key_name = "atsp-preprod-pge"

  user_data = <<-EOF
              #!/bin/bash
              #Update pakage
              sudo yum update -y
              #Installing Docker
              sudo yum install -y docker
              sudo service docker start
              sleep 3
              #install rancher agent
              sudo docker run -e CATTLE_HOST_LABELS='services=redis'  -d --privileged -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/rancher:/var/lib/rancher rancher/agent:v1.0.2 http://[Rancher-Server-IP]:8080/v1/scripts/47746910A163C2129ACF:1484154000000:bNAhx48cEY6Bz2xp9e8dEcTB2zU
              EOF

  root_block_device {
    volume_type = "gp2"
    volume_size = "200"
    delete_on_termination = "true"
   }
      tags {
        Name = "PGE-Dev-Redis"
        Deployment = "Dev"
        Component = "Redis"
        Project = "PGE"
    }
  lifecycle {
    create_before_destroy = true
  }
}
resource "aws_instance" "ELK" {
  count = "2"
  ami = "ami-5ec1673e"
  instance_type = "m4.xlarge"
  subnet_id="subnet-10f76a66"
  security_groups = ["sg-a22176c4"]
  key_name = "atsp-preprod-pge"

  user_data = <<-EOF
              #!/bin/bash
              #Update pakage
              sudo yum update -y
              #Installing Docker
              sudo yum install -y docker
              sudo service docker start
              sleep 3
              #install rancher agent
              sudo docker run -e CATTLE_HOST_LABELS='services=ELK'  -d --privileged -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/rancher:/var/lib/rancher rancher/agent:v1.0.2 http://[Rancher-Server-IP]:8080/v1/scripts/47746910A163C2129ACF:1484154000000:bNAhx48cEY6Bz2xp9e8dEcTB2zU
              EOF

  root_block_device {
    volume_type = "gp2"
    volume_size = "200"
    delete_on_termination = "true"
   }
      tags {
        Name = "PGE-Dev-ELK"
        Deployment = "Dev"
        Component = "ELK"
        Project = "PGE"
    }
  lifecycle {
    create_before_destroy = true
  }
}
resource "aws_instance" "Monitoring" {
  count = "3"
  ami = "ami-5ec1673e"
  instance_type = "m4.xlarge"
  subnet_id="subnet-10f76a66"
  security_groups = ["sg-a22176c4"]
  key_name = "atsp-preprod-pge"

  user_data = <<-EOF
              #!/bin/bash
              #Update pakage
              sudo yum update -y
              #Installing Docker
              sudo yum install -y docker
              sudo service docker start
              sleep 3
              #install rancher agent
              sudo docker run -e CATTLE_HOST_LABELS='services=monitoing'  -d --privileged -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/rancher:/var/lib/rancher rancher/agent:v1.0.2 http://[Rancher-Server-IP]:8080/v1/scripts/47746910A163C2129ACF:1484154000000:bNAhx48cEY6Bz2xp9e8dEcTB2zU
              EOF

  root_block_device {
    volume_type = "gp2"
    volume_size = "200"
    delete_on_termination = "true"
   }
      tags {
        Name = "PGE-Dev-Monitoring"
        Deployment = "Dev"
        Component = "Monitoring"
        Project = "PGE"
    }
  lifecycle {
    create_before_destroy = true
  }
}
#----------------Public Subnet--------------#
resource "aws_instance" "Nginx" {
  count = "2"
  ami = "ami-5ec1673e"
  instance_type = "m4.xlarge"
  subnet_id="subnet-d8f36eae"
  associate_public_ip_address = true
  security_groups = ["sg-ddd7eca5"]
  key_name = "atsp-preprod-pge"

  user_data = <<-EOF
              #!/bin/bash
              #Update pakage
              sudo yum update -y
              #Installing Docker
              sudo yum install -y docker
              sudo service docker start
              sleep 3
              #install rancher agent
              sudo docker run -e CATTLE_HOST_LABELS='services=nginx'  -d --privileged -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/rancher:/var/lib/rancher rancher/agent:v1.0.2 http://[Rancher-Server-IP]:8080/v1/scripts/47746910A163C2129ACF:1484154000000:bNAhx48cEY6Bz2xp9e8dEcTB2zU
              EOF

  root_block_device {
    volume_type = "gp2"
    volume_size = "200"
    delete_on_termination = "true"
   }
      tags {
        Name = "PGE-Dev-LB"
        Deployment = "Dev"
        Component = "Nginx"
        Project = "PGE"
    }
  lifecycle {
    create_before_destroy = true
  }
}
