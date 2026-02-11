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
    - Move changes from your WIP commit to a new arm of the merge:
      `jj split -B merge -A master@upstream .`

# Gripes / issues to keep an eye on

## Conflicts

- Conflicts include lines with the same changes on both sides:
  <https://github.com/jj-vcs/jj/issues/7173>
- Conflict markers do not include the base contents:
  <https://github.com/jj-vcs/jj/issues/6021>
- Conflict markers do not include the revision each side is from:
  <https://github.com/jj-vcs/jj/issues/1176>
- Hard to select conflicted files in templates:
  <https://github.com/jj-vcs/jj/issues/5213>

## Templates

- No easy way to list/format conflicted files:
  <https://github.com/jj-vcs/jj/issues/7377>
- No way to write comments in templates:
  <https://github.com/jj-vcs/jj/issues/5317>
- Whitespace is not allowed before method calls in templates, so you can't do
  the normal method chain syntax: <https://github.com/jj-vcs/jj/issues/7378>

## Log

- No rename-following for logs, rebases: <https://github.com/jj-vcs/jj/issues/6940>
- Count of elided commits is not shown: <https://github.com/jj-vcs/jj/issues/5830>

## Diffs

- No `diff.colorMoved` equivalent: <https://github.com/jj-vcs/jj/issues/76>
- No way to hide diffs for lockfiles: <https://github.com/jj-vcs/jj/issues/4548>

## CLI

- No `jj clean`: <https://github.com/jj-vcs/jj/issues/3154>

## Git interop

- No easy way to import a specific Git commit: <https://github.com/jj-vcs/jj/discussions/7369>

## Workspaces

- No way to move workspaces: <https://github.com/jj-vcs/jj/issues/7113>
- No clear way to clone into a workspace without manually deleting all the
  tracked files: <https://github.com/jj-vcs/jj/issues/7115>
- Workspaces are not colocated as Git repositories
  - This means that any tooling that wants to use Git breaks
  - <https://github.com/jj-vcs/jj/issues/4436>
  - <https://github.com/jj-vcs/jj/issues/8052>

## Performance

- Multiple `$TMPDIR`s results in watchman exiting and restarting, multi-second
  pauses: <https://github.com/jj-vcs/jj/issues/5817>

## Bookmarks

- No way to set `--allow-backwards` by default for `jj bookmark move` and `jj
  bookmark set`: <github.com/jj-vcs/jj/issues/8808>

## Split

- New commit gets the change ID of the input commit when `jj split` is used:
  <https://github.com/jj-vcs/jj/issues/8854>
