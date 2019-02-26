output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}
output "public_subnets" {
  value = ["${aws_subnet.subnet_public.id}"]
}
output "public_route_table_ids" {
  value = ["${aws_route_table.rtb_public.id}"]
}
output "public_instance_ip" {
  value = ["${aws_instance.testInstance.public_ip}"]
}
output "private_key_pem" {
  value = ["${tls_private_key.example.public_key_openssh}"]
}