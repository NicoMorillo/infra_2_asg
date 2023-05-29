> Disclaimer  The user should already have aws access configurated to avoid hardcoding sensitive data into the state file. 

Auto Scaling Group

    The AWS infrastructur, has its principal focus in deploying 2 instance  by **Auto Scaling Group**, following the **ASG** rules defined. The **ASG** works as a fail-over solution for the instances.

Permissions: S3, DyanmoDB, VPC, EC2 and  IAM


The AWS region selected is **us-east-1** to the backend and all the resources.

Before deploying the infrastructure we need to have a **S3 bucket** created to use it as the backend. With the s3 bucket already created, change the value of the bucket name in the code below to set the backend s3 bucket.

Deploy:

Initiate and  run the dybamodb resource to keep lock our state for all operations that could write state.


1. Initiate terraform for dynamo-lock folder:
**Do not forget change <bucket_name>

terraform -chdir="dynamo-lock" init -backend-config= "bucket=<bucket_name>"

2. Run apply to create the dynamo-lock table:

terraform -chdir="./dynamo-lock" apply 

Initiate and run the infrastructure, obtaining in the console the load balancer DNS name

3. Initiate terraform for deploy folder:
**Do not forget change <bucket_name>

terraform -chdir="deploy" init -backend-config="bucket=<bucket_name>"

4. Run apply to deploy all the resources:

terraform -chdir="deploy" apply


Test:

With the loadbalancerlink, open your browser and check the page. 

The goal is to retrieve two different EC2 ID after refreshing the web page.


Destroy all infrastructure:

terraform -chdir="./dynamo-lock" destroy -auto-approve

terraform -chdir="deploy" destroy -auto-approve

