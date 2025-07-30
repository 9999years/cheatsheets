See: <https://github.com/jj-vcs/jj>

- Revsets: <https://jj-vcs.github.io/jj/latest/revsets/>
- Settings: <https://jj-vcs.github.io/jj/latest/config/>
- Git conversion table: <https://jj-vcs.github.io/jj/latest/git-command-table/>

# Workflows

- "Megamerge": <https://v5.chriskrycho.com/journal/jujutsu-megamerges-and-jj-absorb>
  - Keep a number of changes in your working copy and split changes as you make
    them into new 'parallel' commits.
  - Also: <https://ofcr.se/jujutsu-merge-workflow>
  - Create a new stream of work: `jj split -B merge -A master@upstream -i`
    - TODO: Can we do something clever with revsets here?

# Problems

- No `diff.colorMoved` equivalent: <https://github.com/jj-vcs/jj/issues/76>
- No rename-following for logs, rebases: <https://github.com/jj-vcs/jj/issues/6940>
- No `jj clean`: <https://github.com/jj-vcs/jj/issues/3154>
- Workspaces are a bit underbaked.
  - No way to move workspaces: <https://github.com/jj-vcs/jj/issues/7113>
  - No way to list workspace paths: <https://github.com/jj-vcs/jj/issues/6854>
  - No clear way to clone into a workspace without manually deleting all the
    tracked files: <https://github.com/jj-vcs/jj/issues/7115>
  - Workspaces are not colocated as Git repositories: <https://github.com/jj-vcs/jj/issues/4436>
- Multiple `$TMPDIR`s results in watchman exiting and restarting, multi-second
  pauses: <https://github.com/jj-vcs/jj/issues/5817>
- Conflicts include lines with the same changes on both sides:
  <https://github.com/jj-vcs/jj/issues/7173>
- Conflict markers do not include the base contents:
  <https://github.com/jj-vcs/jj/issues/6021>
- Conflict markers do not include the revision each side is from:
  <https://github.com/jj-vcs/jj/issues/1176>
