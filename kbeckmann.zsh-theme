ZSH_THEME_GIT_PROMPT_PREFIX=" %{$bg[yellow]$fg[black]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

PROMPT='$fg[magenta][%*] %{$fg[red]%}$(hostname) $fg[green]%}%d%{$reset_color%}$ZSH_THEME_GIT_PROMPT_PREFIX$(git_current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX
%(!.#.$) '
