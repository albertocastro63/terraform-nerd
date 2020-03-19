# Introduction to Terraform Modules

This repository contains all the materials for a presentation on Terraform Modules. Slides for the talk are provided in a PDF.

Each example consists of several drafts and final code.

## Example 1

Basic  `terraform`  script to create an EC2 instance in AWS.

**draft1**: With one command create an EC2 instance hardcoding all the information.

**draft2**: Introduce variables and outputs in the single file script.

**final**: Split the inputs, outputs, and resources into 3 files and add a data source resource to get information about the default vpc in order to create a security group for the EC2 instance.

## Example 2

Building on the previous example we start creating re-usable modules. A security group module is introduced as well. 

**draft1**: Start by building 2 modules to create an EC2 instance and a security group respectively. The security group module has its rules hard coded in the file. Rewrite `example1/final` using these modules.

**draft2**: Rewrite the security group module to abstract the ingress and egress rules so they can be specified parametrically in the calling script. Add one more instance and one more security group to the mix.

**final**: A DynamoDB table was created and an IAM Role that is applied to the EC2 instances so they can access the table. The EC2 module is modified to accept the role input.

### Tips

- To format a Terraform file run in the directory that contains the files:
```bash
terraform fmt
```
- To format all the files for the current and child directories recursively execute:
```bash
find . -type d -exec terraform fmt '{}' \;
```

- To input optional values with the CLI:
```bash
terraform plan -var "my_local_ip=xxx.xxx.xxx.xxx"
terraform apply -var "my_local_ip=xxx.xxx.xxx.xxx"
```

- Can also set environment variables with the format `TF_VAR_name`:
```bash
export TF_VAR_my_local_ip=xxx.xxx.xxx.xxx
terraform plan
terraform apply
```

- If you want to insert secrets securely you can use [`summon`](https://cyberark.github.io/summon/) this program runs a shell where the secrets are set as environment variables that are retrieved from a secure store. After execution the variables are no longer available.