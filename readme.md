
## git-nuke
### Nuke objects from git history.
Usage `./git-nuke file-to-nuke`<br>
Example `./git-nuke src/foo/bar/die.txt`<br>
Use from inside the repo.
Call `./git-nuke` with no arguments to list the all objects on the repo sorted by size, handy!<br>
After nuking something, force push to any remotes.

Put together by me but the commands are from the links on the bottom.<br><br>
**Needless to say this is a pretty drastic thing to do. Be careful.**

### Install

- `cd` to repo
- backup `.git`: `cp .git .git.bak`
- `curl -o git-nuke https://raw.githubusercontent.com/Thomazella/git-nuke/master/main.bash`
- `chmod u+x git-nuke`
- `./git-nuke file-to-nuke`

To automate nuking a list of files:

- get file names by copying
- paste in a file, `list.txt`, one filename per line
- add a newline at the end of the file, just to be safe
- run `while read -r file; do ./git-nuke "$file"; done < list.txt`

### Sources:

[SO thread](https://stackoverflow.com/questions/5277467/how-can-i-clean-my-git-folder-cleaned-up-my-project-directory-but-git-is-sti)<br>
[Post](https://dalibornasevic.com/posts/2-permanently-remove-files-and-folders-from-a-git-repository)
