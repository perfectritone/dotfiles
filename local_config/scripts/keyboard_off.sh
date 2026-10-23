#!/usr/bin/env zsh
# Disable/enable the built-in laptop keyboard via the kernel's input inhibit
# switch, so it works under both X11 and Wayland. Writing the switch needs root
# unless root_config/etc/udev/rules.d/91-keyboard-inhibit.rules is installed.

built_in_keyboard_name='AT Translated Set 2 keyboard'

built_in_keyboard_inhibited() {
  local name
  for name in /sys/class/input/input*/name; do
    [[ $(<$name) == $built_in_keyboard_name ]] && echo ${name:h}/inhibited && return
  done
  return 1
}

set_built_in_keyboard_inhibited() {
  local inhibited
  inhibited=$(built_in_keyboard_inhibited) || { echo "no '$built_in_keyboard_name' found" >&2; return 1 }
  if [[ -w $inhibited ]]; then
    echo $1 > $inhibited
  else
    echo $1 | sudo tee $inhibited > /dev/null
  fi
}

alias keyboard-off="set_built_in_keyboard_inhibited 1"
alias keyboard-on="set_built_in_keyboard_inhibited 0"
alias ko=keyboard-off
alias kon=keyboard-on
