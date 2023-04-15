# pouchdb-aws-ec2-server-nginx README

PouchDB is a Javascript rewrite of CouchDB (originally written in Erlang), that can run on nodejs servers.

This project provides an automated AWS EC2 server-based deployment of PouchDB, fronted by nginx for extra security.

The PouchDB server runs inside a Docker container, and Nginx is used as a reverse proxy to manage user authentication.

## Getting Started

To get started with this project, deploy the attached AWS CloudFormation template. This will create an EC2 instance in your AWS account with PouchDB and Nginx installed and configured.

### Prerequisites

- An AWS account
- A configured AWS CLI or SDK with appropriate permissions

### Deployment

To deploy the CloudFormation stack, save the CFT content provided in the question to a file named `pouchdb-aws-ec2-server-nginx.yaml` and then run the following command:

```bash
aws cloudformation create-stack --stack-name pouchdb-aws-ec2-server-nginx --template-body file://pouchdb-aws-ec2-server-nginx.yaml --capabilities CAPABILITY_IAM
```

### Accessing PouchDB

Once the stack has been successfully created, you can access the PouchDB instance at:

```
http://EC2_INSTANCE_PUBLIC_IP:5984
```

Replace `EC2_INSTANCE_PUBLIC_IP` with the public IP address of the created EC2 instance.

### Default Credentials

The default username for the PouchDB admin user is `pouchdbadmin`. The password is generated during the stack creation and stored in AWS Systems Manager Parameter Store under the key `${EnvironmentPrefix}pouchdb-admin`. To retrieve the password, run:

```bash
aws ssm get-parameter --name test-pouchdb-admin --with-decryption --query 'Parameter.Value' --output text
```
