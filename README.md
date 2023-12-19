## Project Name: Terraform AWS Infrastructure Automation
> SQS to DynamoDb with lambda

## Description
This is a terraform project, built to practice as well as showcase my terraform skills. In this project I have build a basic pipeline to stream messages coming from SQS queue into a dynamodb table. The architecture is event driven with the help of lambda severless processing.

The soul of the project is the `terraform-aws-infra` directory, and constitutes __70 percent__ effort of the project. 

## Terraform has been used to create the following resource
* DynamoDb tables
* SQS Queue
* IAM Policies and Roles
* Lambda Function
* Lambda Function trigger as SQS

## Prerequisites
Before diving in, make sure you have the following tools installed:
- [Terraform](https://www.terraform.io/downloads.html) (v0.14+)
- [AWS CLI](https://aws.amazon.com/cli/) (v2+)

## Architecture Diagram
Refer to `architecture-diagram.png` in the root directory to visualize the interconnected AWS services managed by this Terraform module.

![lab1-terraform-lambda](/assets/lab1-terraform-lambda.jpg)

## Usage
1. Clone this repository to your local machine:
   ```bash
   git clone https://github.com/your-username/terraform-aws-infrastructure.git
   cd terraform-aws-infrastructure
   ```

2. Initialize your Terraform workspace:
   ```bash
   terraform init
   ```

3. Apply the configuration:
   ```bash
   terraform apply
   ```
   Review the plan, and if everything looks good, approve it.

## Permissions
IAM roles and permissions are carefully managed to follow the principle of least privilege.

## Logging & Monitoring
Amazon CloudWatch provides real-time insights into your resources. Monitor effectively and stay informed.

## License
This project is licensed under the MIT License. See `LICENSE.md` for details.

---

Happy Terraforming! 🚀