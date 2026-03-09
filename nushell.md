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

Nushell has _no_ tests for and no _way_ to test its interactive behavior. You
cannot pipe input to Nushell and you can't use anything like pexpect to test it
either due to various nonsense in the interactive components.

Some issues to keep an eye on here. Note that several of these are closed but
not actually resolved; the nushell maintainers seem to frequently close issues
if they can find any _conceivable_ workaround for a particular complaint,
regardless of it it solves the underlying issue. Many of these issues have
extensive discussion _after_ being closed. lol, lmao, as they say

- No way to set `~/.config/nushell` as your configuration directory on macOS:
  https://github.com/nushell/nushell/issues/893

- No grammar is listed, many parts of the language are undocumented (e.g.
  assignment): https://github.com/nushell/nushell/issues/12957

- https://github.com/nushell/nushell/issues/12956
  These are parsed differently:

      let $example = "hello"
      let $my_example = example  # Runs a command

      mut $my_example = ""
      $my_example = example  # Parses as a string

- https://github.com/nushell/nushell/issues/12750
  String interpolation is extremely verbose:

      cd $"($env.ENV_PREFIX)/my/dir/to/($env.PACKAGE)"

- https://github.com/nushell/nushell/issues/1275
  No fuzzy find

- https://github.com/nushell/nushell/issues/8214
  Hard/impossible to conditionally source a file (needs `source
  empty_file.nu` workaround)

- https://github.com/nushell/nushell/issues?q=is%3Aopen+label%3Acompletions+sort%3Acomments-desc
  Completions for external commands are clumsy and require generating
  yet another completion script.

  - https://github.com/nushell/nushell/issues/11337
    No standard path for package managers to install completion scripts
    to; users must manually add such paths.
