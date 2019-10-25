#!/usr/bin/env bash

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
TMUX_THEME_FILE="$TMUX_THEMES/$TMUX_THEME.conf"

tmux display-message -p "[INFO] Loading theme '$TMUX_THEME' at '$TMUX_THEME_FILE'!"
tmux if-shell "test -f $TMUX_THEME_FILE" \
  "source-file $TMUX_THEME_FILE" \
  "display-message -p \"[WARNING] Could not locate theme '$TMUX_THEME' at '$TMUX_THEME_FILE'!\""
