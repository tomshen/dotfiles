# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# === General ===
setopt autocd          # if a command is a directory, go to it
setopt completealiases # tab-complete aliases
setopt nomatch         # print error if a pattern doesn't match

# b/c Debian/Ubuntu defaults are weird
if [ `uname` = "Linux" ]; then
	autoload -U up-line-or-beginning-search
	autoload -U down-line-or-beginning-search
	zle -N up-line-or-beginning-search
	zle -N down-line-or-beginning-search
	bindkey "^[[A" up-line-or-beginning-search # Up
	bindkey "^[[B" down-line-or-beginning-search # Down
fi

# === Completion ===
zstyle :compinstall filename '~/.zshrc'

# case-insensitive (all),partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' \
'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

autoload -Uz compinit && compinit

# === ZSH Plugins ===
source ~/.dotfiles/plugins/zsh-z.plugin.zsh
source ~/.dotfiles/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# === Powerlevel10k ===
source ~/.dotfiles/plugins/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# === Aliases ===
if [ `uname` = "Darwin" ]; then
	alias ls='ls -G'
	alias grep='grep --colour'
	elif [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	alias dir='dir --color=auto'
	alias vdir='vdir --color=auto'
	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi
alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -CF'

