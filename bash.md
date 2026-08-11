# Bash

See snippets: `~/.dotfiles/config/nvim/snippets/sh.snippets`

Or online: https://github.com/9999years/dotfiles/blob/main/config/nvim/snippets/sh.snippets

## Test: `[` / `[[`

`-n` -> nonempty

`-z` -> empty ("zero")

`=`, `==`, `!=` are for strings, `-eq`, `-ne`, `-lt`, `-le`, `-gt`, `-ge` are
for numerics. (Remember: `<` and `>` are redirections and don't make sense for
strings, so numerics have to be the spelled out ones...?)

## ANSI colors

See: ./ansi.md

	RESET="$(echo -e "\e[0m")"
	BOLD="$(echo -e "\e[1m")"
	DIM="$(echo -e "\e[2m")"
	BRIGHT_RED="$(echo -e "\e[31m")"
	BRIGHT_GREEN="$(echo -e "\e[32m")"
	BRIGHT_YELLOW="$(echo -e "\e[33m")"

## Arrays

```bash
myArray=()                           # Create a new array variable
myArray+=("myElement")               # Append
ls "${myArray[@]}"                   # Use array elements as arguments
(( ${#myArray[@]} != 0 ))            # Check if empty
"${#myArray[@]}"                     # Length
( IFS=$'\n'; echo "${myArray[*]}" )  # Join by delimiter

# Iterate over array elements:
for element in "${myArray[@]}"; do
    echo "$element"
done
```
