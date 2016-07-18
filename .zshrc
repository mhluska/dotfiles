HISTFILE=~/.histfile
HISTSIZE=$((2**32 - 1))
SAVEHIST=${HISTSIZE}

# Enable UTF-8 (helps with vim-airline patched font).
export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Use Vim bindings for line editing.
bindkey -v
bindkey "^R" history-incremental-search-backward

# Disable autocorrect.
unsetopt correctall

# Just typing a directory calls `cd` on it.
setopt autocd

# Extended patterns like `**`.
setopt extendedglob

# Don't put duplicate lines or lines starting with space in the history.
setopt histignoredups histignorespace

# Share history between windows.
setopt share_history

# Can type comments in the terminal.
setopt interactivecomments

# Makes `BASH_REMATCH` work for regex capture groups.
setopt BASH_REMATCH

# Adds substitution to the prompt.
setopt prompt_subst

# Makes Rake tasks work.
unsetopt nomatch

# Configure prompt formatting for Git info.
autoload -Uz vcs_info
zstyle ':vcs_info:git*' actionformats ' %F{cyan}%b %F{1}(%a%)%f'
zstyle ':vcs_info:git*' formats ' %F{cyan}%b%f'
precmd() {
    vcs_info
}

PROMPT='%n@%m${vcs_info_msg_0_}:%{$(pwd)%${#PWD}G%}%# '

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# See `https://www.npmjs.com/package/eslint-friendly-formatter#eff-no-gray`.
export EFF_NO_GRAY=true

eval "$(pyenv init -)"

if [ -f "${HOME}/.aliases" ]; then
    source "${HOME}/.aliases"
fi

export PATH="${PATH}:${HOME}/bin"
