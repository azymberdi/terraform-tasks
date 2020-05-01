output "created_by" {
    value       =       "rash_balo"
}

output "vpc_id" {
    value   =   "${aws_vpc.task3.id}"
}

output "eip_id" {
    value   =   "${aws_eip.eip.id}"
}

output "key_pair_name" {
    value   =   "${aws_key_pair.eu-west-1-key.key_name}"
}

output "sec_group_id" {
    value   =   "${aws_security_group.task3_sg.id}"
}

output "sec_group_name" {
    value   =   "${aws_security_group.task3_sg.name}"
}


output "instance_ip" {
    value   =   "${aws_instance.web.public_ip}"
}

output "domain_name" {
    value   =   "${aws_route53_record.www.name}"
}