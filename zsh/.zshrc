# .zshrc

# report long-running tasks
REPORTTIME=3

# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz compinit && compinit

# Load vcs_info for Git prompt
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }

# precmd
precmd_functions+=( precmd_vcs_info )
precmd_functions+=( check_weather_cache )

# prompt
setopt prompt_subst
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '*' # %u
zstyle ':vcs_info:*' stagedstr '+' # %c
zstyle ':vcs_info:git:*' formats ' (%b%u) '

# Prompt format
export PROMPT='% %F{6}%* %F{12}%~%F{9}$vcs_info_msg_0_%F{12}$ '
export CLICOLOR=1 # Colour coding for folders

# Git Config
git config --global push.default current # Push to current remote branch

# Git Aliases
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status

# Other Aliases
alias charles="export http_proxy='http://localhost:8888'" # Enables using Charles with terminal
alias ddd="rm -rf ~/Library/Developer/Xcode/DerivedData" # Delete Derived Data
alias weather="curl wttr.in"
alias moon="curl 'wttr.in?format="%m"'"
alias grod="git reset --hard origin/develop"
alias grom="git reset --hard origin/main"
alias loadkeys="~/.ssh/loadkeys.sh"
alias prweekly="git log --pretty=format:'%ad %s' --date=format:'%W' --after='2020-01-01' | grep '.)$' | cut -c1-2 | uniq -c"
alias prmonthly="git log --pretty=format:'%ad %s' --date=format:'%m' --after='2020-01-01' | grep -v 'bot' | grep '.)$' | cut -c1-2 | uniq -c"
alias prdaily="git log --pretty=format:'%ad %s' --date=format:'%j' --after='2020-01-01' | grep '.)$' | cut -c1-3 | uniq -c"
alias scctool="scc . -M '.json' -M '.xcconfig' -M '.bzl' -M 'BUCK' -M '.build' -M '.csv' -M '.md' -w -d"
alias swupdate="softwareupdate -i -a -R" # -i means install, -a means all, -R means restart if needed, -l means list

# Notes

# - https://gist.github.com/Bunn/dee546cef4fed925ecf1be4ebcd1e5ca # clean up
# - xip -x Xcode_12.1_GM_seed.xip # unzip skipping validate step
# - /usr/bin/security cms -D -i FordPass_Pro_EUDEV.mobileprovision # Profile inspect

# Sources
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
source /usr/local/share/chxcode/chxcode
source /usr/local/share/chxcode/auto
