function fish_right_prompt
  # Setup colors
  set -l time (set_color E2E2D9)
  echo -n -s $time ' [' $time (date +%H:%M:%S) $time '] '
end
