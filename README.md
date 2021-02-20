Distance calculator in AWS
====================================

Make a web service that accepts two distances (numbers) and returns the total distance (sum of both) deployable at AWS.

## Specifications

#### Languages: 

* Terraform: Used to deploy the AWS Cloud infrastructure.
* JavaScript: Used to create the webpage with the required functionality.

####AWS EC2 Resources:

* Launch Configuration
* Autoscaling Group
* Security Group
* Keypair

## Solution Approach

I decided to use the EC2 Service, provided by AWS. Instead os deploying a simple EC2 Instance, I've chosen something similar, but also different: it's called Autoscaling Group. There are many benefits of using it, such as:

* Better fault tolerance. Amazon EC2 Auto Scaling can detect when an instance is unhealthy, terminate it, and launch an instance to replace it. You can also configure Amazon EC2 Auto Scaling to use multiple Availability Zones. If one Availability Zone becomes unavailable, Amazon EC2 Auto Scaling can launch instances in another one to compensate.

* Better availability. Amazon EC2 Auto Scaling helps ensure that your application always has the right amount of capacity to handle the current traffic demand.

* Better cost management. Amazon EC2 Auto Scaling can dynamically increase and decrease capacity as needed. Because you pay for the EC2 instances you use, you save money by launching instances when they are needed and terminating them when they aren't.

I've chosen t2.micro instance type, and Amazon Linux AMI, both included in the free tier. The Autoscaling Group chooses diferent availability zones for the instances, creating a Multi-AZ environment.
To deploy the Autoscaling Group, I needed to define the Launch Configuration first and specify which characteristics I want my instances to have.
The security group deployed provides access through ports 80 (HTTP) and 22 (SSH).
I thought it was a good practice to create a user data template and attach it to the Launch Configuration, this way, we can assure that every instance deployed by the Autoscaling Group has the same configuration. Each instance runs all the commands defined in the user data template , when its launched for the first time.
The template creates a simple Apache server and runs the JavaScript code on the landing page (index.html). I'm aware of the simplicity of the script, I just wanted to cover the basic functionality required and focus on the deployment of the infrastructure.
The code also creates a keypair that lives in the Terraform state and could be extracted with an output. This part wasn't really necessary, but I thought it could be interesting.

## Possible Improvements

* It is always a good idea to deploy a Load Balancer to distribute the incoming traffic to the Autoscaling Group. Using a Load Balancer increases the availability and fault tolerance of your applications.

* There are many ways to secure our instances, like controlling the network access (VPC configuration, private subnets,security groups...), creating specific IAM roles and using SSM instead of SSH to access the instance

* We can use AWS KMS (Key Managemente Service) to create and manage keys.

* Instead of keeping the terraform.tfstate locally, I recommend storing it in a S3 bucket and access it using a terraform_remote_state data.


## Links to the Web Service

There are currently 2 running instances deployed with the same configuration, so we can use any of their Public DNS:

* http://ec2-34-243-190-158.eu-west-1.compute.amazonaws.com/
* http://ec2-34-245-56-250.eu-west-1.compute.amazonaws.com/


