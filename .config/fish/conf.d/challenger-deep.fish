set -l foreground cbe3e7
set -l selection  44475a
set -l comment    6272a4

set -l red    ff8080
set -l orange ffb378
set -l yellow ffe9aa
set -l green  95ffa4
set -l cyan   aaffe4
set -l pink   ff79c6
set -l purple c991e1

set -g fish_color_autosuggestion $selection
set -g fish_color_command        $purple
set -g fish_color_comment        $comment
set -g fish_color_end            $orange
set -g fish_color_error          $red
set -g fish_color_escape         $pink
set -g fish_color_normal         $foreground
set -g fish_color_operator       $green
set -g fish_color_param          $cyan
set -g fish_color_quote          $yellow
set -g fish_color_redirection    $foreground
set -g fish_color_search_match   --background=$selection
set -g fish_color_selection      --background=$selection
