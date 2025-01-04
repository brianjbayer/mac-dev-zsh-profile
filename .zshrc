# ----------------------------------
# Z shell for MacOS profile
# ----------------------------------

#-- HOMEBREW --
# Add Homebrew package management to shell environment
# This is inside baseball from the brew install script
# Determine where brew itself is installed based on Intel vs Apple Silicon
[[ `uname -m` == "arm64" ]] && homebrew_prefix="/opt/homebrew" || homebrew_prefix="/usr/local"
eval "$(${homebrew_prefix}/bin/brew shellenv)"
unset homebrew_prefix

# -- PACKAGE MANAGERS --
# Put any nvm, rbenv/rvm, etc config here

# -- UTILITIES (ETC.) --
# Enable git autocomplete
autoload -Uz compinit && compinit

# -- ALIASES --
# If there is a ~/.alias file, source it in to profile
[[ -f ~/.alias ]] && source ~/.alias

# -- PATH --
# Put any path modifications here

#--- PROMPT ---
# Zshell specific includes git branch in prompt
# Simple function to get the git branch
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
# NOTE: PROMPT_SUBST must be set for variable/special character expansion
setopt PROMPT_SUBST
# Prompt:username@shorthostname currentdirectoryonly (gitbranchname)%
PROMPT='%n@%m %1~%F{green}$(parse_git_branch)%f%# '
