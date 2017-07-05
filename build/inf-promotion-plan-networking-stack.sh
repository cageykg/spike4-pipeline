tf_repo_url=$1
stack_name=$2
environment=$3
tag=$4

git clone ${tf_repo_url} tf_repo

cd tf_infrastructure/${environment}/${stack_name}
git checkout tags/${tag}

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
