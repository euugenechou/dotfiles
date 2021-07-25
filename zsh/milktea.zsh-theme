## Derived from geoffgarside's theme.

local red="${fg[red]%}"
local yellow="${fg[yellow]%}"
local magenta="${fg[magenta]%}"
local reset="${reset_color%}"

PROMPT='%{$red%}%n%{$reset%}::%{$yellow%}%~%{$reset%}$(git_prompt_info) $ '

ZSH_THEME_GIT_PROMPT_PREFIX=" $magenta"
ZSH_THEME_GIT_PROMPT_SUFFIX="$reset"
