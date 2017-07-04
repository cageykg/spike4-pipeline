module "microservice" {
    source = "github.com/cageykg/spike4-pipeline//modules/common/microservice"

    service_name = "${var.service_name}"
    service_port = "${var.service_port}"
    service_image_id = "${var.service_image_id}"
    vpc_name = "${var.vpc.name}"
    vpc_id = "${var.vpc.id}"
    internal_subnet_id = "${var.internal_subnet_id}"
    external_subnet_id = "${var.external_subnet_id}"
}