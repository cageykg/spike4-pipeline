tf_repo_url=$1
stage_name=$2
environment_name=$3
stack_name=$4
tag=$5

git clone ${tf_repo_url} tf_repo

cd tf_repo/environments/${stage_name}/${environment_name}/${stack_name}

git checkout tags/${tag}
echo "terraform apply would happen here..."
