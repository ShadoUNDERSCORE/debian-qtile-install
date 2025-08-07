local ret_status="%(?:%{$fg_bold[white]%}➜ :%{$(echo "\e[38;2;114;92;173m")%}➜ %s)"

PROMPT=$'%{$(echo "\e[1;38;2;114;92;173m")%}%n@%m: %{$reset_color%}%{$fg[blue]%}%~ %{$reset_color%}%{$fg_bold[white]%}$(git_prompt_info)%{$fg_bold[white]%} % %{$reset_color%}
${ret_status} %{$reset_color%} '

PROMPT2="%{$fg_bold[black]%}%_> %{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="(%{$fg_bold[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$(echo "\e[38;2;114;92;173m")%}✗%{$reset_color%}%{$fg_bold[white]%})"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[white]%})"




