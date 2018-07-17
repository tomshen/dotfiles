# === General ===
setopt autocd          # if a command is a directory, go to it
setopt completealiases # tab-complete aliases
setopt nomatch         # print error if a pattern doesn't match

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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
zstyle :compinstall filename '/Users/tom/.zshrc'

# case-insensitive (all),partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' \
'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

autoload -Uz compinit && compinit

# === Prompt ===
fpath=( "$HOME/.zfunctions" $fpath )
autoload -Uz promptinit && promptinit
prompt pure

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

. `brew --prefix`/etc/profile.d/z.sh

alias g='./gradlew'
alias ydl="youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4'"
