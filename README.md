# AWS 3-Tier Architecture using Terraform

## 📌 Project Overview

This project provisions a **3-tier AWS infrastructure using Terraform Infrastructure as Code (IaC)**.

The architecture separates the environment into:

- **Web Tier** – public subnets with an internet-facing Application Load Balancer and EC2 Auto Scaling Group.
- **Application Tier** – private subnets with an internal Application Load Balancer and EC2 Auto Scaling Group.
- **Database Tier** – private database subnets with Amazon RDS MySQL configured for Multi-AZ.

The infrastructure is defined as Terraform resources so that the AWS environment can be created and managed consistently through code.

## 🏗️ Architecture

### Traffic Flow

```text
Internet
   |
Internet Gateway
   |
Public Subnets
   |
Web Application Load Balancer
   |
Web Tier - EC2 Auto Scaling Group
   |
Application Load Balancer
   |
Application Tier - EC2 Auto Scaling Group
   |
Private Database Subnets
   |
Amazon RDS MySQL (Multi-AZ)
```

## ☁️ AWS Services Used

| Service | Purpose |
|---|---|
| **Amazon VPC** | Provides the isolated network environment |
| **Public Subnets** | Hosts internet-facing web resources |
| **Private Subnets** | Hosts application and database resources |
| **Internet Gateway** | Provides internet connectivity for the public tier |
| **NAT Gateway** | Provides outbound internet access from private resources |
| **Application Load Balancer** | Distributes traffic across EC2 instances |
| **EC2** | Provides compute resources for web and application tiers |
| **Auto Scaling Group** | Maintains and scales EC2 instances |
| **Launch Template** | Defines EC2 instance configuration |
| **Amazon RDS MySQL** | Provides the database tier |
| **Security Groups** | Controls network traffic between tiers |
| **Elastic IP** | Provides a static public IP for the NAT Gateway |
| **Amazon S3** | Used as the Terraform remote state backend |
| **Terraform** | Provisions and manages the AWS infrastructure |

## 🔧 Terraform Implementation

The project is organized into separate Terraform files based on infrastructure components.

### Networking

- VPC
- Public subnets
- Private application subnets
- Private database subnets
- Internet Gateway
- NAT Gateway
- Elastic IP
- Public and private route tables

### Web Tier

- Internet-facing Application Load Balancer
- Web target group
- Web Auto Scaling Group
- Web launch template
- Web security groups
- EC2 instances deployed across two web subnets

### Application Tier

- Internal Application Load Balancer
- Application target group
- Application Auto Scaling Group
- Application launch template
- Application security groups
- EC2 instances deployed across two private application subnets

### Database Tier

- Database subnet group
- Amazon RDS MySQL
- Multi-AZ configuration
- Dedicated database security group

## 📈 Auto Scaling Configuration

Both the Web and Application Auto Scaling Groups are configured with:

- **Desired capacity:** 2
- **Minimum capacity:** 1
- **Maximum capacity:** 4
- **Health check type:** EC2

This allows the infrastructure to maintain multiple EC2 instances and provides a foundation for scaling workloads.

## 🔐 Security Design

The architecture separates resources into public and private network tiers.

- Web resources are placed in public subnets.
- Application resources are placed in private subnets.
- Database resources are placed in private database subnets.
- Dedicated security groups are used for the different tiers.
- NAT Gateway provides outbound connectivity for private resources without making them directly public.

> **Security Note:** Never commit private keys, passwords, access keys, or secret `.tfvars` files to a public GitHub repository. Use `.gitignore`, environment variables, AWS Secrets Manager, or another secure secret-management solution.

## 🚀 Deployment

### Prerequisites

Install and configure:

- AWS CLI
- Terraform
- Git
- An AWS account with the required permissions

Verify Terraform:

```bash
terraform --version
```

Verify AWS CLI:

```bash
aws --version
```

Configure AWS credentials:

```bash
aws configure
```

### Clone the Repository

```bash
git clone https://github.com/vipultalele-04/aws-3tier.git
cd aws-3tier
```

### Initialize Terraform

```bash
terraform init
```

### Validate the Configuration

```bash
terraform validate
```

### Review the Execution Plan

```bash
terraform plan
```

### Apply the Infrastructure

```bash
terraform apply
```

Type:

```text
yes
```

when Terraform asks for confirmation.

### Destroy the Infrastructure

When the infrastructure is no longer required:

```bash
terraform destroy
```

## 📂 Project Structure

```text
aws-3tier/
│
├── architecture-diagram.png
├── README.md
│
├── provider.tf
├── backend.tf
├── variables.tf
├── terraform.tfvars
├── output.tf
│
├── vpc.tf
├── web-subnets.tf
├── app-subnets.tf
├── db-subnets.tf
│
├── internet-gw.tf
├── nat-gw.tf
├── eip.tf
├── public-rt.tf
├── private-rt.tf
│
├── alb-web.tf
├── alb-app.tf
├── tg-web.tf
├── tg-app.tf
│
├── lauch-template-web.tf
├── lauch-template-app.tf
├── asg-web.tf
├── asg-app.tf
│
├── alb-sg-web.tf
├── alb-sg-app.tf
├── asg-sg-web.tf
├── asg-sg-app.tf
├── db-sg.tf
│
├── db-subnet-group.tf
├── rds.tf
│
└── user-data.sh
```

## 🎯 Key Learning Outcomes

This project provided hands-on practice with:

- Infrastructure as Code using Terraform
- AWS VPC networking
- Public vs. private subnet design
- Internet Gateway and NAT Gateway
- Application Load Balancers
- EC2 Launch Templates
- Auto Scaling Groups
- Amazon RDS MySQL
- Multi-AZ database configuration
- Security Groups
- Terraform variables and outputs
- Terraform remote state using Amazon S3
- Bash/user-data automation
- Git and GitHub version control

## 🧰 Technologies

**AWS | Terraform | EC2 | VPC | ALB | Auto Scaling | RDS MySQL | S3 | NAT Gateway | Internet Gateway | Security Groups | Linux | Bash | Git | GitHub**

## 👨‍💻 Author

**Vipul Rajendra Talele**

GitHub: [vipultalele-04](https://github.com/vipultalele-04)

Project: [aws-3tier](https://github.com/vipultalele-04/aws-3tier)
