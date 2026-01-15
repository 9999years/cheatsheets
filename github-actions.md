# github actions

## Release CI

TL;DR: Here's the link: <https://github.com/peter-evans/create-pull-request/blob/main/docs/concepts-guidelines.md#authenticating-with-github-app-generated-tokens>

I like clickops/gitops release CI. Here's how it works:

1. For clickops, you use a `workflow_dispatch` trigger to let the user click
   "run the 'bump versions and create a release PR'" in the GitHub Actions tab
   of the repository.

   The user selects the kind of version bump they want.

   For gitops, you indicate this info by labeling your PR patch/minor/major.

2. A new PR is created which bumps the version numbers and updates e.g.
   `Cargo.lock` or Nix files.

3. When that PR is merged, a release is built and published (to GitHub releases
   and package repositories), and then the commit is tagged automatically.

There's some tricky parts here: normally your GitHub Actions default API token
won't be able to create PRs, or GitHub Actions won't run when a GitHub
Actions-created PR is merged. To avoid infinite bot loops, I guess?

Anyways, the only real way around this is using a GitHub App, which takes some
clicking but it's Fine. You can also use a Personal Access Token but this is
bad for several fairly obvious reasons.

All of this is made extra tedious because you need a new app for each
repository to avoid credential escalation risks.

Here's how to set it up:
<https://github.com/peter-evans/create-pull-request/blob/main/docs/concepts-guidelines.md#authenticating-with-github-app-generated-tokens>

See it in use:
- <https://github.com/9999years/npingler/blob/570a77e2e7831ec42a84c29e9908b729e2fd91e7/.github/workflows/version.yaml>
- <https://github.com/9999years/npingler/blob/570a77e2e7831ec42a84c29e9908b729e2fd91e7/.github/workflows/release.yaml>
