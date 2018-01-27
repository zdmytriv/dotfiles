### Git cheatsheet

```
git diff                       : compare current with staged (or with last commit if no staged one)
git diff —staged               : compare staged with last commit
git diff <master>…<topicbr>    : show diff introduced by topicbr comparing to master (base commit in master)
git diff <sha-1>               : show diff betwheen latest commit of current branch and other commit (sha-1)

git log -n                     : view last n commits
git log -n -p                  : last n commits with summary of changes (diff)
git log -n —graph              : graphical view branch history
git log —pretty=oneline        : each commit at one line
git log <br1> —not <br2>       : list commits which are in br1 but not in br2
git log <br1> <br2> —not <br3> : list commits which are in br1 and br2 but not br3
git log <master>..<topicbr>    : show commits that reachable from topic but not from master (—||—)
git log origin/master..HEAD    : show what will be pushed to remote in case of push (—||—)
git log <master>…<topic>       : show commits not reachable from both branches semitaneousely (not shared)
git log —left-right <master>…<topic> : same to previous, but show which commit at which branch

git remote -v                  : list remotes
git remote add <name> <url>    : add remote
git remote show [remote]       : details of remote
git remote rename <old> <new>  : rename remote
git remote rm <remote>         : delete remote reference

git reset HEAD [file]          : unstage file or all files
git checkout — [file | *]      : revert unstaged file (* for all files) to last commit state
reset HEAD; checkout *         : revert all the changes in current branch
git reset --hard origin/master : revert to remote state

git checkout -b <branch>       : make a new branch basing on current
git checkout -b <branch> <remote>/<rmtbranch> : make a local copy of branch fetched from remote (tracking copy)
git checkout -—track <remote>/<rmtbranch>     : —||—
git checkout -b <branch> <sha-1>              : make a new branch basing on some commit and switch to it
git checkout -b <branch> <basebrsanch>        : make a new branch basing on other branch and switch to it

git branch -d <branch>         : delete branch
git branch -v                  : list branches with last commit for each
git branch —merged             : list branches merged to current (can be deleted)
git branch —no-merged          : list all not merged to current

git fetch [remote]             : get data from remote (not merge with local)
git pull [remote]              : get data from remote and merge into local
git push [remote] [branch]     : send branch state to remote
git push [remote] [<localbranch>:<remotebranch>] : same but with diff name of remote branch
git push <remote> :<remotebranch> : remove branch on remote server

git tag                        : list all available tags
git tag -l “*”                 : filter tags by pattern
git tag <name>                 : create lightweight tag for last commit
git tag <name> <sha-1>         : create tag for not the latest commit
git tag -a <name> -m <msg>     : create annotated tag (-s instead -a --> signed tag)
git show <tag name>            : show commit marked by tag, and tag’s info
git tag -v <tag name>          : verify signed tag
git push <remote> <tag>        : push tag to remote
git push <remote> —tags        : push all tags to remote
git describe [branch]          : get current branch state (latest tag + number of commits after); kind of build number

git merge <branch>             : merge specified branch into current
git rebase <branch>            : rebase current branch to the latest commit of <branch>
git rebase —onto <tarbr> <br1><br2> : rebase br2 from br1 to latest tarbr separately from any changes made within br1
git rebase -i HEAD~3           : change last 3 commits (like amend but for n commits)
DO NOT rebase commits that were pushed to remote!

git merge-base <br1> <br2>     : show common ancestor of the two branches

git cherry-pick <sha-1>        : rebase specified commit to the top of current branch

git stash                      : save all uncommitted changes from current branch and clear branch to not changed
git stash list                 : list stashes
git stash apply [stash@{n}]    : apply latest stash if not specified, apply n-th stash otherwise
git stash apply <st> —index    : apply latest stash including “staged” states of the files
git stash drop <st>            : delete stash
stash -> checkout another branch -> stash apply : move changes from one branch to another
git stash branch <newbranch>   : make a new branch from stash and remove stash

git filter-branch —tree-filter ‘<cmd>’ HEAD [—all] : apply ‘cmd' to each commit in current branch or all branches

git blame                      : annotate the file
git bisect                     : interactive binary search of the commit that introduced a bug

git config —global core.excludesfile <some_gitignore> : set common .gitignore for all files
git config —global color.ui true : colour output
```