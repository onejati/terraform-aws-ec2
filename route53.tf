#------------------------------------------#
# AWS R53 Configuration
#------------------------------------------#
resource "aws_route53_record" "www-dev" {
   zone_id = "${var.zone_id}"
   name = "dev.aerpge.com"
   type = "A"
   ttl = "300"
   records = ["${aws_instance.Nginx.0.public_ip}"]
   records = ["${aws_instance.Nginx.1.public_ip}"]
}
