export PS1='\u@\H:\w$ '

# Merge history from all terminals
export PROMPT_COMMAND='history -a'

# Tell ls to be colourful
export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

# System
alias ll='ls -GFhl'
alias lh='ls -FGlAhp'
alias cp='cp -v'
alias mv='mv -v'
alias mkdir='mkdir -v'
alias git-log='git log --pretty=oneline --abbrev-commit'
alias weather='curl wttr.in/lviv'
alias port='function _port(){ lsof -i TCP:$1; };_port'

# Goodies
alias k='kubectl'
alias port='function _port(){ lsof -i TCP:$1; };_port'
alias git-log='git log --date=short --pretty=format:"%C(124)%ad %C(24)%h %C(34)%an %C(252)%s%C(178)%d"'
alias git-undo='git reset --soft HEAD~1'
alias showdotfiles="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hidedotfiles="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
alias dnsflush="dscacheutil -flushcache && killall -HUP mDNSResponder"
alias http-ngrok="ngrok http "
alias www="python -m SimpleHTTPServer "
alias weather='curl wttr.in/lviv'
alias ipe='curl ipinfo.io/ip'
alias ipi='ipconfig getifaddr en0'
alias cheat='function _cheat() { curl https://cht.sh/$1; }; _cheat'
alias psql='/Applications/Postgres.app/Contents/Versions/9.6/bin/psql'
alias kubectl-all='function _k8s_all_resources(){ kubectl api-resources --verbs=list --namespaced -o name | xargs -n 1 kubectl get --show-kind --ignore-not-found -n ${1:-default}; };_k8s_all_resources'
alias k8s-istio-ingress-gateway-port-forwarding='kubectl -n istio-system port-forward $(kubectl -n istio-system get pods -listio=ingressgateway -o=jsonpath="{.items[0].metadata.name}") 15000'
alias k8s-istio-ingress-gateway-logs='kubectl -n istio-system logs $(kubectl -n istio-system get pods -listio=ingressgateway -o=jsonpath="{.items[0].metadata.name}") --tail=300 -c istio-proxy'
alias k8s-gitops-help-operator-logs='stern --tail 100 -l app=flux-helm-operator -n gitops'
alias k8s-gitops-flux-logs='stern --tail 100 -l app=flux -n gitops'
alias k8s-ingress-logs='stern --tail 100 -l app=nginx-ingress -n nginx-ingress'

# Scripts
SCRIPTS='~/workspace/Scripts'

alias idiff="$SCRIPTS/idiff.sh"
alias pr="$SCRIPTS/fetch_pr.sh"
alias ebt="$SCRIPTS/aws/ebt.py"
alias ec2="$SCRIPTS/aws/ec2.py"

# Maven
alias mcit='mvn -T 1C clean install -DskipTests=true -Dmaven.site.skip=true -Dmaven.javadoc.skip=true | tee /tmp/mvn-`date "+%Y-%m-%d-%H-%M"`.log; terminal-notifier -message "Build is done!" -title "Maven" -sound Frog'
alias mcit2='mvn -T 1C clean install -Dmaven.test.skip=true -DskipTests -Dmaven.site.skip=true -Dmaven.javadoc.skip=true | tee /tmp/mvn-`date "+%Y-%m-%d-%H-%M"`.log; terminal-notifier -message "Build is done!" -title "Maven" -sound Frog'
alias mci='mvn clean install | tee /tmp/mvn-`date "+%Y-%m-%d-%H-%M"`.log; terminal-notifier -message "Build is done" -title "Maven" -sound Frog'
alias mci2='mvn -T 1C clean install | tee /tmp/mvn-`date "+%Y-%m-%d-%H-%M"`.log; terminal-notifier -message "Build is done!" -title "Maven" -sound Frog'
alias tcurl='curl -w "\n    time_namelookup:  %{time_namelookup}\n       time_connect:  %{time_connect}\n    time_appconnect:  %{time_appconnect}\n   time_pretransfer:  %{time_pretransfer}\n      time_redirect:  %{time_redirect}\n time_starttransfer:  %{time_starttransfer}\n -------------------  ----------------\n         time_total:  %{time_total}\n\n"'

# hstr
export HISTFILE=~/.zsh_history
export HSTR_CONFIG=prompt-bottom,rawhistory,keywords-matching
export HSTR_PROMPT="bck-i-search: "
bindkey -s "\C-r" "\eqhstr\n"

# SSH-Agent fix
eval `ssh-agent -s` > /dev/null 2>&1

# Profiles
. $HOME/workspace/Scripts/profiles/vgs
. $HOME/workspace/Scripts/profiles/k8s
