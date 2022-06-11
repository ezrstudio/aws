# ezRStudio-aws

Running RStudio server on AWS made easy! 

## How to use

This is aims to be as simple as possible for those who have very little to no knowledge in the cloud,  but there are several ways you can use ezRStudio and most settings are customizable, please check the documentation at https://docs.ezrstudio.net for more details. 

## Requirements

please read the [documentation](https://docs.ezrstudio.net), but at least you need to have an AWS account and you are responsible for the costs of infrastructure you are spining up, we try to stay within the free tier by default but that is not always the case. please read the documentation so you understand  what resources this project is spining up for you. 

## Used AWS Resources

You can define what types of servers you want for any image type, however by default this is what we are starting up: 

* VPC
* SSH Key Pair
* Security group
* EC2 Instance
    * Lousaslett AMI: t3.micro  (This AMI Supports any type of instance)
    * rstudio AMI: g4dn.xlarge (This AMI only supports instances with Graphics cards)
    * relevancelab AMI: t2.large (This AMI only supports t2.large instances)
    * Custom AMI: t3.micro


# Contribute

Suggestions and Pull Requests are always welcome. 
If you find a bug or run into any issues, feel free to open an Issue and I will help you as soon as possible. 

Documentation is also fully opensource [here](https://github.com/ezrstudio/docs), contributions here are always very welcomed! 

If you like this project and you want to contribute in a different way, you can always consider to:

<a href="https://www.buymeacoffee.com/4s3ti" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-yellow.png" alt="Buy Me A Coffee" style="height: 51px !important;width: 217px !important;" >

# Terraform Technical information
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | 3.4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.16.0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 3.4.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ec2_instance"></a> [ec2\_instance](#module\_ec2\_instance) | terraform-aws-modules/ec2-instance/aws | ~> 3.0 |
| <a name="module_key_pair"></a> [key\_pair](#module\_key\_pair) | terraform-aws-modules/key-pair/aws | n/a |
| <a name="module_rstudio_sg"></a> [rstudio\_sg](#module\_rstudio\_sg) | terraform-aws-modules/security-group/aws | ~> 4.9.0 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | n/a |

## Resources

| Name | Type |
|------|------|
| [tls_private_key.this](https://registry.terraform.io/providers/hashicorp/tls/3.4.0/docs/resources/private_key) | resource |
| [aws_ami.louisaslett](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_ami.relevance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_ami.rstudio](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami_type"></a> [ami\_type](#input\_ami\_type) | Type of AMI to use, cuda, tensorflow, custom | `string` | `"louisaslett"` | no |
| <a name="input_az"></a> [az](#input\_az) | Availability zone to place the instance at | `string` | `null` | no |
| <a name="input_create_key"></a> [create\_key](#input\_create\_key) | Defines if ssh privatekey is going to be created | `bool` | `true` | no |
| <a name="input_custom_ami"></a> [custom\_ami](#input\_custom\_ami) | Custom AMI Id to be used | `any` | `null` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | The type of ec2 instance to be used | `string` | `"t3.micro"` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | The ssh keypair name | `string` | `"RSTudio-SSH"` | no |
| <a name="input_monitoring"></a> [monitoring](#input\_monitoring) | enables monitoring on the instance | `bool` | `false` | no |
| <a name="input_region"></a> [region](#input\_region) | Region to place resources | `string` | `"eu-central-1"` | no |
| <a name="input_rstudio_instance_type"></a> [rstudio\_instance\_type](#input\_rstudio\_instance\_type) | Instance type to be used by rstudio AMI, use only GPU instances | `string` | `"g4dn.xlarge"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_address"></a> [address](#output\_address) | n/a |
| <a name="output_dns_name"></a> [dns\_name](#output\_dns\_name) | n/a |
| <a name="output_instance_id"></a> [instance\_id](#output\_instance\_id) | n/a |
| <a name="output_ip_address"></a> [ip\_address](#output\_ip\_address) | n/a |
<!-- END_TF_DOCS -->