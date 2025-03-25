# nushell

PowerShell... 2!!!!

This one's weird. I've been keeping my eyes on it for years.

Thinks config files should go in `~/Library/Application Support/nushell/` on macOS.

The string interpolation syntax seems to be `$"hello ($name)"`.

Syntax around variables is odd and unexplained in the docs (https://github.com/nushell/nushell/issues/12956).

```nushell
# WRONG: This creates a closure, not a string variable.
$env.LESS_TERMCAP_mb = {ansi red_bold}
# WRONG: Fails to parse with "expected operator" at `red_bold`.
$env.LESS_TERMCAP_mb = ansi red_bold
# RIGHT: Use parenthesis to call a function...?
$env.LESS_TERMCAP_mb = (ansi red_bold)
```

Similarly, it's not entirely clear when barewords are used.

```nushell
# These are equivalent:
let $name = "Rebecca"
let name = "Rebecca"

# Parses as the string "name":
$env.NAME = name
# Correct, uses the variable:
$env.NAME = $name

# But this fails with "External command failed; No such file or directory":
let my_name = name

mut my_name = "Rebecca"
# This attempts to run a command called `my_name`!
my_name = name
# And this gets parsed as a bareword again!
$my_name = name
```

Aliases: https://www.nushell.sh/book/aliases.html

```nushell
alias ll = ls -la
```
