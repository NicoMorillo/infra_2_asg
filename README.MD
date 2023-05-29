> Disclaimer || The user should already have aws access configurated to avoid hardcoding sensitive data into the state file. 

## Auto Scaling Group
 The AWS infrastructur, has its principal focus in deploying 2 instance  by **Auto Scaling Group**, following the **ASG** rules defined. The **ASG** works as a fail-over solution for the instances.

| Permissions | 
    | ------ |
    | S3|
    | DyanmoDB|
    | VPC|
    | EC2|
    | IAM|


The AWS region selected is **us-east-1** to the backend and all the resources.

Before deploying the infrastructure we need to have a **S3 bucket** created to use it as the backend. With the s3 bucket already created, change the value of the bucket name in the code below to set the backend s3 bucket.

## _**Deploy:**_

__Initiate__ and __run__ the dybamodb resource to keep lock our state for all operations that could write state.


1. Initiate terraform for dynamo-lock folder:
**Do not forget change <bucket_name>
```sh
terraform -chdir="dynamo-lock" init -backend-config= "bucket=<bucket_name>"
 ```
2. Run apply to create the dynamo-lock table:
```sh
terraform -chdir="./dynamo-lock" apply 
```
__Initiate__ and __run__ the infrastructure, obtaining in the console the __load balancer DNS name__

3. Initiate terraform for deploy folder:
**Do not forget change <bucket_name>
```sh
terraform -chdir="deploy" init -backend-config="bucket=<bucket_name>"
```
4. Run apply to deploy all the resources:
```sh
terraform -chdir="deploy" apply
```

## _**Test:**_

With the __load_balancer_link__, open your browser and check the page. 

The goal is retrieve two diferent EC2 ID after refresh the web page.


## _**Destroy all infrastructure:**_
```sh
terraform -chdir="./dynamo-lock" destroy -auto-approve

terraform -chdir="deploy" destroy -auto-approve
```
