Update your Git branch:
- jj branch set your-branch -r HEAD@git

# Commands to investigate

- git commit -am -> jj describe && jj new
    - describe sets the message, new finishes the commit
- git commit --amend -> jj squash
- git checkout BRANCH -> jj checkout BRANCH (jj co BRANCH)
    - alias for `jj new`
- git rebase -i main -> jj rebase -d main
- git status -> jj status
- git show HEAD^ -> jj show @-
    - if you use `jj show @^` it will kindly inform you that the `@-` means
      parents of the working commit.

# Git equivalents

- git add --patch -> jj split
- git branch -v -> jj branch list (jj b l)

# Rebasing

jj rebase takes a set of commits and a destination (-d/--destination). the set
of commits can be given with:
- jj rebase -b BRANCH -d DEST for everything in BRANCH but not DEST
- jj rebase -s REV -d DEST for REV and everything after it
- jj rebase -r REV -d DEST for a single commit

You can specify multiple destinations to create merge commits.
