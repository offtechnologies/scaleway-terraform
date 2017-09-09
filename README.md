# scaleway-terraform

Automating Rancher operations with Terraform Scaleway provider.

### Initial setup

Clone the repository and install the dependencies.
Install Terraform and jq using Homebrew and pull the required Terraform modules.
If you are on linux, after installing Terraform and jq packages, run `terraform init`.
Note that you'll need Terraform v0.10 or newer to run this project.

```bash
$ git clone https://github.com/offtechnologies
$ cd dir
# requires brew
$ brew update
$ brew install terraform
$ terraform -v
$ brew install jq
$ terraform init
```

Before running the project you'll have to create an access token for Terraform to connect to the Scaleway API.
Using the token and your access key, create two environment variables:

```bash
$ export SCALEWAY_ORGANIZATION="<ACCESS-KEY>"
$ export SCALEWAY_TOKEN="<ACCESS-TOKEN>"
```
You could set these environment variables in your .bashrc file, so that they’re enabled every time you start a session.


### Usage

```bash
# create a workspace
terraform workspace new dev

# generate plan
terraform plan

# run the plan
terraform apply
```

This will do the following:

* reserves public IPs for node
* provisions one or more VC1S servers with Ubuntu 16.04 LTS
* creates a security group for the Rancher node allowing SSH and HTTP/S inbound traffic
* starts the Rancher node and installs Docker CE using the local SSH agent
