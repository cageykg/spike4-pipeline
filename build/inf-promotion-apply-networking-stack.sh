tf_repo_url=$1
stack_name=$2
environment=$3
tag=$4

git clone ${tf_repo_url} tf_repo

cd tf_infrastructure/${environment}/${stack_name}

git checkout tags/${tag}
echo "terraform apply would happen here..."
