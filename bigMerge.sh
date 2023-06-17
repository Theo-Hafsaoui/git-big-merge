#!/bin/bash

README_CONTENT="# test"

add_repo_to_hosting_repo() {
		path_repo_to_branch="$1"
		branch_name=$(eval md5sum $path_repo_to_branch/doc | awk '{print $1}')
		cd ./page/
		git switch --creat $branch_name && git remote add $branch_name ../$path_repo_to_branch && git fetch --all && git rebase $branch_name/master && git switch master
		echo "le repo est $repo_to_branch sur la branche $branch_name "
		cd ../
}


init_hosting_repo() {
		mkdir page;
		cd page;
		echo "$README_CONTENT" > readme.md;
		git init && git add readme.md && git commit -m "init"
		cd ../
}

get_all_repo() {
		eval "find . -type d -exec test -e '{}/.git' ';' -print -prune"
}

all=$(get_all_repo)

if [ ! -f ./page ]; then
		echo "no page file, creatting one"
		init_hosting_repo
fi

for repo in $all
do
		if [ -f $repo/doc ] && [ repo!="./page" ]; then
				add_repo_to_hosting_repo $repo
		else
				echo "pas de fichier"
		fi
done
