#!/usr/bin/env zsh
zmodload zsh/pcre
setopt REMATCH_PCRE

built_in_keyboard_regex='.*AT Translated Set 2 keyboard\s+id=(\d+)'

xinput list | while read SEARCH
do
[[ $SEARCH =~ $built_in_keyboard_regex ]] && INTERNAL_KEYBOARD_ID=$match[1]
done

alias keyboard-off="xinput set-int-prop $INTERNAL_KEYBOARD_ID \"Device Enabled\" 8 0"
alias keyboard-on="xinput set-int-prop $INTERNAL_KEYBOARD_ID \"Device Enabled\" 8 1"
alias ko=keyboard-off
