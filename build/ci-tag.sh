build_number=$1
stack_name=$2
tag_version="${stack_name}-v${build_number}"

cd tf_repo
git tag -a ${tag_version} -m "Tagged as ${tag_version}"
git push origin ${tag_version}
