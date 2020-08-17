
### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
# zinit light-mode for \
    # zinit-zsh/z-a-rust \
    # zinit-zsh/z-a-as-monitor \
    # zinit-zsh/z-a-patch-dl \
    # zinit-zsh/z-a-bin-gem-node
 zinit light https://github.com/agnoster/agnoster-zsh-theme.git
#  zinit light marlonrichert/zsh-autocomplete
 setopt prompt_subst

 # Load OMZ Git library
# zinit snippet OMZL::git.zsh

# Load Git plugin from OMZ
# zinit snippet OMZP::git

### End of Zinit's installer chunk

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm

export CLICOLOR=1
#export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
#export LANG=en_US.utf8 //if you receive an error about "prompt_segment:5: character not in rage"

zstyle ':completion:*:*:*:*:globbed-files' matcher 'r:|?=** m:{a-z\-}={A-Z\_}'
zstyle ':completion:*:*:*:*:local-directories' matcher 'r:|?=** m:{a-z\-}={A-Z\_}'
zstyle ':completion:*:*:*:*:directories' matcher 'r:|?=** m:{a-z\-}={A-Z\_}'
zstyle ':completion:*' menu select
setopt globdots
autoload -Uz compinit
compinit

alias gst="git status"