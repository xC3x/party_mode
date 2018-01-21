# name: party_mode

function fish_prompt
  # Cache exit status
  set -l last_status $status

  # Just calculate these once, to save a few cycles when displaying the prompt
  if not set -q __fish_prompt_char
    switch (id -u)
      case 0
        set -g __fish_prompt_char \u276f\u276f
      case '*'
        set -g __fish_prompt_char »
    end
  end

  # Setup colors
  set -l normal (set_color (get_random_color))
  set -l name (set_color (get_random_color))
  set -l prompt (set_color (get_random_color))
  set -l bred (set_color -o red)
  

  # Configure __fish_git_prompt
  set -g __fish_git_prompt_show_informative_status false
  set -g __fish_git_prompt_showcolorhints true

  # Color prompt char red for non-zero exit status
  set -l prompt_color (set_color (get_random_color))
  if [ $last_status -ne 0 ]
    set prompt_color $bred
  end

  # Top
  echo -n $name$USER$normal in $prompt(prompt_pwd)$normal 
  __fish_git_prompt

  echo -n " "
  # Bottom
  echo -n $prompt_color$__fish_prompt_char $normal
end


function get_random_color
  echo (hex)(hex)(hex)(hex)(hex)(hex)
end

function hex
  set hex_values 0 1 2 3 4 5 6 7 8 9 A B C D E F
  set hex_value (random choice $hex_values)
  echo $hex_value
end