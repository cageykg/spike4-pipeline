tf_repo_url=$1
tag=$2
stage_name=$3
environment_name=$4
stack_name=$5

git clone ${tf_repo_url} tf_repo

cd tf_repo/environments/${stage_name}/${environment_name}/${stack_name}

# replace any occurrence of 'source....<stack_name>....' with 'source....<stack_name>?ref=<tag>'
tf_files=$(/bin/ls *.tfvars *.tf 2> /dev/null)
perl -pe "s/(source.*?${stack_name}).*/\1?ref=${tag}\"/g" -i ${tf_files}

git status
git diff HEAD .
git commit -a -m "Updated module ${stack_name} to ${tag} in ${stage_name} ${environment_name} ${stack_name}"
git push
