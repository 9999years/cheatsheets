See: <https://github.com/jj-vcs/jj>

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
