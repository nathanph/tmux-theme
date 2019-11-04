#!/usr/bin/env sh

tmux set-option -gqo @TMUX_HOME "$HOME/.config/tmux"
TMUX_HOME="$(tmux show-option -gv @TMUX_HOME)"

tmux set-option -gqo @TMUX_CACHE "$HOME/.cache/tmux"
TMUX_CACHE="$(tmux show-option -gv @TMUX_CACHE)"

tmux set-option -gqo @TMUX_THEMES "$TMUX_HOME/themes"
TMUX_THEMES="$(tmux show-option -gv @TMUX_THEMES)"

tmux set-option -gqo @TMUX_PLUGINS "$TMUX_HOME/plugins"
TMUX_PLUGINS="$(tmux show-option -gv @TMUX_PLUGINS)"

# Use our theme if it exists.
TMUX_THEME="$(tmux show-option -gv @TMUX_THEME)"
TMUX_THEME_FILE="$TMUX_THEMES/$TMUX_THEME/theme.tmux"

tmux display-message "[INFO] Loading theme '$TMUX_THEME' at '$TMUX_THEME_FILE'!"

if [ -f "$TMUX_THEME_FILE" ]; then
  tmux source-file "$TMUX_THEME_FILE"
  tmux display-message "[INFO] Theme '$TMUX_THEME' successfully loaded!"
else
  tmux display-message "[WARNING] Could not locate theme '$TMUX_THEME' at '$TMUX_THEME_FILE'!"
fi
