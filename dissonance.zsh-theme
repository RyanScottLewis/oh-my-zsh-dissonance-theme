# Git prompt component
ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$reset_color%}"

# Git status
zsh_theme_git_status() {
  local cb=$(git_current_branch)
  if [ -n "$cb" ]; then
    echo "$(parse_git_dirty)%{$fg_bold[yellow]%}%{$reset_color%}$ZSH_THEME_GIT_PROMPT_PREFIX$(git_current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

# RVM version
zsh_theme_rvm_version() {
  echo "${$(ruby_prompt_info)/ruby/rb}"
}

# RVM prompt component
ZSH_THEME_RVM_PROMPT_PREFIX="%{$fg[red]%}["
ZSH_THEME_RVM_PROMPT_SUFFIX="]%{$reset_color%}"

# Jobs prompt component
ZSH_THEME_JOBS_PREFIX="%{$FG[003]%}["
ZSH_THEME_JOBS_SUFFIX="]%{$reset_color%}"
ZSH_THEME_JOBS="%1(j.$ZSH_THEME_JOBS_PREFIX%j job%2(j.s.)$ZSH_THEME_JOBS_SUFFIX.)"

# URI scheme
zsh_theme_uri_scheme() {
  if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    echo "ssh"
  else
    echo "file"
  fi
}

# URI prompt component
ZSH_THEME_URI_USER="%{$FG[153]%}%n%{$reset_color%}"
ZSH_THEME_URI_AT="%B@%b"
ZSH_THEME_URI_HOST="%{$FG[110]%}%M%{$reset_color%}"
ZSH_THEME_URI_SLASH="%B/%b"
ZSH_THEME_URI_PATH="%{$FG[117]%}%d%{$reset_color%}"
ZSH_THEME_URI_SCHEME="%B$(zsh_theme_uri_scheme)://%b"
ZSH_THEME_URI="$ZSH_THEME_URI_SCHEME$ZSH_THEME_URI_USER$ZSH_THEME_URI_AT$ZSH_THEME_URI_HOST$ZSH_THEME_URI_SLASH$ZSH_THEME_URI_PATH"

# Dollar prompt component
ZSH_THEME_DOLLAR="%(?.%{$FG[106]%}.%{$FG[124]%})%B$%b%{$reset_color%}"

# Setup prompts
RPS1='$(zsh_theme_git_status)$(zsh_theme_rvm_version)$ZSH_THEME_JOBS $EPS1'
PROMPT="$ZSH_THEME_URI $ZSH_THEME_DOLLAR "

# FOR SCREENSHOT
return 1
return 0
sleep 100 &
sleep 100 &
kill %1 && kill %2
mkdir test && cd test && git init
touch test
git add . && git commit -am "Init"
cd .. && rm -rf test
rvm use jruby-1.7.19
rvm use default
ssh mpu.local
exit
