#! /usr/bin/env bash

######################################################################
# nuke objects from your repo. Usage: ./git-nuke src/foo/bar/die.txt #
######################################################################

# Put together by Thomazella <thomazella9@gmail.com> github.com/Thomazella
# Code is from the links on the bottom.
# Needless to say this is a pretty drastic thing to do. Be careful.

# if no arguments list the biggest objects in the repo
if [ "$#" == 0 ]; then
    echo Listing objects on repo. Bigger on bottom. Wait...
    git rev-list --objects --all | while read -r hash name; do echo -e "$(git cat-file -s "$hash")"\\t "$name"; done | sort -n
    exit 0
fi

# rewrite all branches (!!)
git filter-branch -f --index-filter "git rm --cached --ignore-unmatch $1" --prune-empty --tag-name-filter cat -- --all
# delete the ref, dereference it, I'm not sure
git for-each-ref --format='delete %(refname)' refs/original | git update-ref --stdin
# mark it expired
git reflog expire --expire=now --all
# garbage collect it away
git gc --prune=now

# sources:
# https://stackoverflow.com/questions/5277467/how-can-i-clean-my-git-folder-cleaned-up-my-project-directory-but-git-is-sti
# https://dalibornasevic.com/posts/2-permanently-remove-files-and-folders-from-a-git-repository
