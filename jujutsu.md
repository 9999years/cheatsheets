See: <https://github.com/jj-vcs/jj>

# Workflows

- "Megamerge": <https://v5.chriskrycho.com/journal/jujutsu-megamerges-and-jj-absorb>
  - Keep a number of changes in your working copy and split changes as you make
    them into new 'parallel' commits.

# Problems

- No `diff.colorMoved` equivalent: <https://github.com/jj-vcs/jj/issues/76>
- No rename-following for logs, rebases: <https://github.com/jj-vcs/jj/issues/6940>


# Misc

Update your Git branch:
- jj branch set your-branch -r @-

Move changes to a parent commit:
- jj squash -i

Move changes in general:
- jj move {--from|--too}

Edit a diff without checking out:
- jj diffedit [-r REV]

# Git commands

- git commit -am ... -> jj commit -m ...
    - jj describe && jj new
    - describe sets the message, new finishes the commit
- git add --patch -> jj split
- git commit --patch -> jj commit --interactive
- git commit --amend -> jj squash
- git checkout BRANCH -> jj checkout BRANCH (jj co BRANCH)
    - alias for `jj new`
- git rebase -i main -> jj rebase -d main
- git status -> jj status
- git show HEAD^ -> jj show @-
    - if you use `jj show @^` it will kindly inform you that the `@-` means
      parents of the working commit.
- git branch -v -> jj branch list (jj b l)

# Rebasing

jj rebase takes a set of commits and a destination (-d/--destination). the set
of commits can be given with:
- jj rebase -b BRANCH -d DEST for everything in BRANCH but not DEST
- jj rebase -s REV -d DEST for REV and everything after it
- jj rebase -r REV -d DEST for a single commit

You can specify multiple destinations to create merge commits.

# Resolving conflicts

- jj resolve
- `jj new REVISION` to create a new resolution commit after the given commit
  with conflicts
- then `jj squash` to combine the commits
