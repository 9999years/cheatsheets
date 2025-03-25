# tmux/vim window arrangement

I have some things I can't do in Tmux, some things I can't do in Vim. Let's fix this.

## tmux-only

- `C-o` and `M-o`: Rotate panes in window. No equivalent seems to exist!
  There's `CTRL-W_r` but it "only works within the row or column of windows that
  the current window is in."
- `z`: (Toggle) Zoom the current pane. Closest equivalent seems to be
  `CTRL-W_|` and then `CTRL-W__`.

## vim-only

- `:q`: close window without discarding contents + bindings for bringing it back later
- `C-w _`: maximize current window vertically
- `C-w H`/J/K/L: Move window left/right/up/down

