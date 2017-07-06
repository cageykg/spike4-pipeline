tf_repo_url=$1
tag=$2
stage_name=$3
environment_name=$4
stack_name=$5

git clone ${tf_repo_url} tf_repo

cd tf_repo/${stage_name}/${environment_name}/${stack_name}

sed -i 's/\(source.*${stack_name}\).*/\1?ref=${tag}/g' *.tf*


git diff


