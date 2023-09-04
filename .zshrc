# ----------------------------------
# Z shell for MacOS profile
# ----------------------------------

#-- HOMEBREW --
# Add Homebrew package management to shell environment
# Add brew shellenv to your ~/.zshrc file"
# This is inside baseball from the brew install script
# Determine where brew itself is installed based on Intel vs Apple Silicon
[[ `uname -m` == "arm64" ]] && homebrew_prefix="/opt/homebrew" || homebrew_prefix="/usr/local"
eval "$(${homebrew_prefix}/bin/brew shellenv)"
unset homebrew_prefix

# -- PACKAGE MANAGERS --
# For Node Version Manager NVM from homebrew install instructions
# TODO: Is this correct?
# export NVM_DIR="$HOME/.nvm"
# [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
# [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"

# -- UTILITIES (ETC.) --
# Enable git autocomplete
autoload -Uz compinit && compinit

# -- ALIASES --
# Basic Aliases
alias lsa='ls -al '
alias cls='clear '

# Git Aliases
alias ga='git add '
alias gb='git branch '
alias gc='git commit '
alias gcm='git commit -m '
alias gd='git diff '
alias go='git checkout '
alias gs='git status '
alias golo='git log '

# -- PATH --
# Nothing yet

#--- PROMPT ---
# Zshell specific includes git branch in prompt
# Simple function to get the git branch
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
# NOTE: PROMPT_SUBST must be set for variable/special character
# expansion
setopt PROMPT_SUBST
# Prompt:username@shorthostname currentdirectoryonly (gitbranchname)%
PROMPT='%n@%m %1~%F{green}$(parse_git_branch)%f%# '
