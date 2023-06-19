#!/bin/bash

README_CONTENT="# test"

add_repo_to_hosting_repo() {
		path_repo_to_branch="$1"
		branch_name=$(basename "$1")
		cd ./page/
		echo $branch_name
		echo $branch_name
		git switch --creat $branch_name && git remote add  $branch_name ../$path_repo_to_branch  && git fetch --all --quiet && git rebase $branch_name/master && python ../git-filter-repo --prune-empty=always --force
		git switch master
		echo "le repo est $repo_to_branch sur la branche $branch_name "
		cd ../
}


init_hosting_repo() {
		mkdir page;
		cd page;
		echo "$README_CONTENT" > readme.md;
		git init && git add readme.md && git commit -m "init"
		git config filter.branch.squelchWarning true
		cd ../
}

get_all_repo() {
		eval "find . -type d -exec test -e '{}/.git' ';' -print -prune"
}

get_nb_repo() {
		eval "find . -type d -exec test -e '{}/.git' ';' -print -prune | wc -l"
}

all=$(get_all_repo)
nb_repo=$(get_nb_repo)
echo "Transfering  $nb_repo  into ./page"
wget https://raw.githubusercontent.com/newren/git-filter-repo/main/git-filter-repo

if [ ! -f ./page ]; then
		echo "no page file, creatting one"
		init_hosting_repo
fi

index=0
for repo in $all
do
		if [ -f $repo/doc ] && [ repo!="./page" ]; then
				echo "$index / $nb_repo"
				add_repo_to_hosting_repo $repo
		else
				echo "pas de fichier"
		fi
		((index++))
done

rm git-filter-repo
echo "Done"
