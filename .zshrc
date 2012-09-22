export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8

autoload colors
colors

autoload -U compinit
compinit -u

# 指定したコマンド名がなく、ディレクトリ名と一致した場合 cd する
setopt auto_cd

# cd でTabを押すとdir list を表示
setopt auto_pushd

# 上書きリダイレクトの禁止
setopt no_clobber

# 補完候補が複数ある時に、一覧表示する
setopt auto_list

# コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
setopt magic_equal_subst

# カッコの対応などを自動的に補完する
setopt auto_param_keys

# ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash

# 補完キー（Tab,  Ctrl+I) を連打するだけで順に補完候補を自動で補完する
setopt auto_menu

# sudoも補完の対象
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin

# 色付きで補完する
zstyle ':completion:*' list-colors di=34 fi=0

# 最後がディレクトリ名で終わっている場合末尾の / を自動的に取り除かない
setopt noautoremoveslash

# ヒストリー
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt share_history

export EDITOR=vim

alias ls='ls -G'
alias ll='ls -l'
alias la='ls -la'
