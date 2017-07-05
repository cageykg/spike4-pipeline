tf_repo_url=$1
build_number=$2
stack_name=$3

git clone ${tf_repo_url} tf_repo

echo "##################################################################################"
echo "# Creating the TESTCI VPC"
echo "##################################################################################"

cd tf_repo/environments/dev/TESTCI/vpc

terraform init
TERRAFORM_INIT_RESULT=$?
echo "terraform init result: ${TERRAFORM_INIT_RESULT}"
if [[ ${TERRAFORM_INIT_RESULT} -ne 0 ]]; then
 exit 1
fi

terraform plan
TERRAFORM_PLAN_RESULT=$?
echo "terraform plan result: ${TERRAFORM_PLAN_RESULT}"
if [[ ${TERRAFORM_PLAN_RESULT} -ne 0 ]]; then
 exit 1
fi

terraform apply
TERRAFORM_APPLY_RESULT=$?
echo "terraform apply result: ${TERRAFORM_APPLY_RESULT}"
if [[ ${TERRAFORM_APPLY_RESULT} -ne 0 ]]; then
 exit 1
fi

cd -


echo "##################################################################################"
echo "# Creating the ${stack_name} stack"
echo "##################################################################################"

cd tf_repo/environments/dev/TESTCI/${stack_name}

terraform init
TERRAFORM_INIT_RESULT=$?
echo "terraform init result: ${TERRAFORM_INIT_RESULT}"
if [[ ${TERRAFORM_INIT_RESULT} -ne 0 ]]; then
 exit 1
fi

terraform plan
TERRAFORM_PLAN_RESULT=$?
echo "terraform plan result: ${TERRAFORM_PLAN_RESULT}"
if [[ ${TERRAFORM_PLAN_RESULT} -ne 0 ]]; then
 exit 1
fi

#terraform apply
#TERRAFORM_APPLY_RESULT=$?
#echo "terraform apply result: ${TERRAFORM_APPLY_RESULT}"
#if [[ ${TERRAFORM_APPLY_RESULT} -ne 0 ]]; then
# terraform destory -force
# exit 1
#fi
#terraform destroy -force

cd -
cd tf_repo/environments/dev/TESTCI/vpc
terraform destroy -force

