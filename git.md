# Git

## Splitting commits

1. Start a rebase including the commit:
   ```
   git rebase -i "$COMMIT^"
   ```
2. Mark the commit you want to rebase as edit
3. When you get to that commit:
   a. Reset state to the previous commit:
      ```
      git reset "HEAD^"
      ```
   b. Add and commit changes with `git add` and `git commit`
4. Finish splitting the commit:
   ```
   git rebase --continue
   ```

## `conflictStyle = diff3`

These are hard to read because the order changes depending on if you're doing a rebase or a merge.

If you have `feature-branch` checked out and you want to update it to the
current `main` branch:

```diff
<<<<<<< HEAD
    The "current commit".
    For `git rebase main`, this will be the code in `main`.
        (Because `HEAD` is on top of `main`.)
    For `git merge main`, this will be the code in `feature-branch`.
        (Because `HEAD` is on top of `feature-branch`, and `main` is being
        merged _into_ it.)
||||||| parent of ea45005
    The conflicting lines before either branch changed them.
=======
    For `git rebase main`, this will be the code in `feature-branch`.
        (Because you're stacking the changes in `feature-branch` on top of
        `main`.)
    For `git merge main`, this will be the code in `main`.
        (Because you're adding the changes in `main` to `feature-branch`.)
>>>>>>> ea45005
```
