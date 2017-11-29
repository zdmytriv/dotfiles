export PS1='\u@\H:\w$ '

# Merge history from all terminals
export PROMPT_COMMAND='history -a'

# Tell ls to be colourful
export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

# Goodies
alias ll='ls -l'
alias kc='kubectl'
alias port='function _port(){ lsof -i TCP:$1; };_port'
alias git-log='git log --pretty=oneline --abbrev-commit'
alias weather='curl wttr.in/lviv'

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

# SSH-Agent fix
eval `ssh-agent -s` > /dev/null 2>&1
