# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Ctrl+Dでのログアウトを防止
setopt IGNOREEOF
# エディタをvimに指定
export EDITOR=vim
# 色を使用
autoload -Uz colors && colors
# 日本語ファイル名を表示
setopt print_eight_bit
# beepを無効化
setopt no_beep
# 補完
autoload -Uz compinit && compinit
zstyle ':completion:*:default' menu select=2
# 小文字を区別しない(大文字が含まれる場合は区別する)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# ../の後は今いるディレクトリの補完をしない
zstyle ':completion:*' ignore-parents parent pwd ..
# sudoの後でコマンド名を補完する
zstyle ':completion*:sudo:' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin
# psコマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'
# ヒストリーの共有
setopt share_history
# 重複したヒストリーを表示しない
setopt histignorealldups
# ヒストリーの設定
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# cdコマンドを省略
setopt auto_cd
# pushdを自動で実行
setopt auto_pushd
# pushdから重複を削除
setopt pushd_ignore_dups
# コマンドミスを修正
setopt correct
# cdの後にlsを実行
chpwd() { ls -ltr --color=auto }

# Alias
alias ls='ls --color=auto'
alias lst='ls -ltr --color=auto'
alias la='ls -la --color=auto' 
alias vi='vim'

# BS, Delを使用する
bindkey "^[[3~" delete-char


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
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk
# 補完
zinit light zsh-users/zsh-autosuggestions
# シンタックスハイライト
zinit light zdharma/fast-syntax-highlighting
# Theme
zinit ice depth=1; zinit light romkatv/powerlevel10k

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
