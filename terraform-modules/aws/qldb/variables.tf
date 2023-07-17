variable "name" {
  type        = string
  default     = ""
  description = "(Optional) The friendly name for the QLDB Ledger instance. By default generated by Terraform."
}

variable "permissions_mode" {
  type        = string
  default     = "STANDARD"
  description = "(Required) The permissions mode for the QLDB ledger instance. Specify either ALLOW_ALL or STANDARD."
}

variable "deletion_protection" {
  type        = bool
  default     = true
  description = "(Optional) The deletion protection for the QLDB Ledger instance. By default it is true. To delete this resource via Terraform, this value must be configured to false and applied first before attempting deletion."
}

variable "tags" {
  type        = any
  default     = {}
  description = "AWS Tags"
}

variable "subnet_ids" {
  type        = list(string)
  default     = []
  description = "(Required) The private subnet IDs in which the environment should be created. MWAA requires two subnets."
}

variable "vpc_id" {
  type        = string
  default     = ""
  description = "The vpc ID"
}

variable "ingress_rule" {
  type        = list(any)
  description = "A list of ingress rules"
  default = [
    {
      description      = "TLS from VPC"
      //Port 443 is commonly used port for secure HTTPS traffic
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      cidr_blocks      = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"]
      ipv6_cidr_blocks = []
    },
  ]
}

variable "egress_rule" {
  type        = list(any)
  description = "A list of egress rules"
  default = [
    {
      description      = "Allow outbound HTTPS traffic to VPC"
      //Port 443 is commonly used port for secure HTTPS traffic
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      cidr_blocks      = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"] 
      ipv6_cidr_blocks = ["::/0"]
    },
  ]
}