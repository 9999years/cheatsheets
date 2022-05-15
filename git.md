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
