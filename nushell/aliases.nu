# Aliases migrated from ~/.zshrc.

# Kubernetes
alias kw = ^watch kubectl get pods
def kr [] {
    ^zsh -ic "kubectl get pods -o name | fzf --header 'Run kubectl exec -it <POD> -- sh' --preview 'kubectl describe {}' | xargs -o -I {} kubectl exec -it {} -- sh"
}
def kl [] {
    ^zsh -ic "kubectl get pods -o name | fzf --header 'Run kubectl exec -it <POD> -- sh' --preview 'kubectl logs {}' | xargs -I {} kubectl logs {}"
}
def klp [] {
    ^zsh -ic "kubectl get pods -o name | fzf --header 'Run kubectl exec -it <POD> -- sh' --preview 'kubectl logs --previous {}' | xargs -I {} kubectl logs --previous {}"
}
def kd [] {
    ^zsh -ic "kubectl get pods -o name | fzf --header 'Run kubectl exec -it <POD> -- sh' --preview 'kubectl describe pods {}' | xargs -I {} kubectl describe pods {}"
}
def ks [] {
    ^zsh -ic "kubectl get deployments --no-headers | fzf --header 'Run kubectl scale deployment <DEPLOYMENT> --replicas=1' | cut -f1 -d \" \" | xargs -I {} kubectl scale deployment {} --replicas=1"
}
def ksd [] {
    ^zsh -ic "kubectl get deployments --no-headers | fzf --header 'Run kubectl scale deployment <DEPLOYMENT> --replicas=1' | cut -f1 -d \" \" | xargs -I {} kubectl scale deployment {} --replicas=0"
}
def kcp [] {
    ^zsh -ic "cd ~/Documents/coviflex/coviflex-api && file=\$(find ./devtools/scripts -iname '*.ts' | fzf --header 'Select script file to copy') && pod=\$(kubectl get pods -o name | fzf --header 'Select destination pod' --preview 'kubectl describe {}' | sed 's/^pod\\///') && kubectl cp \"\$file\" \"\$pod\":\"\$file\""
}
def kcps [] {
    ^zsh -ic "cd ~/Documents/coviflex/coviflex-api && file=\$(find ./src -iname '*.ts' | fzf --header 'Select src file') && pod=\$(kubectl get pods -o name | fzf --header 'Select destination pod' --preview 'kubectl describe {}' | sed 's/^pod\\///') && kubectl cp \"\$file\" \"\$pod\":\"\$file\""
}
def kcpsd [] {
    ^zsh -ic "cd ~/Documents/coviflex/coviflex-data && file=\$(find ./src -iname '*.py' | fzf --header 'Select src file') && pod=\$(kubectl get pods -o name | fzf --header 'Select destination pod' --preview 'kubectl describe {}' | sed 's/^pod\\///') && kubectl cp \"\$file\" \"\$pod\":\"\$file\""
}
alias prd = ^kubectx prd2
alias ehp = ^kubectx ehp2
alias kx = ^kubectx

# Lazy git
alias lz = ^lazygit
def gch [] {
    ^zsh -ic "git --no-pager log master --oneline --color=always --no-merges | fzf --ansi -m | awk '{print \$1}' | xargs git cherry-pick"
}

# Oneflex
alias sso = ^aws sso login --profile COVIFLEX-DEVELOPER
def api [] {
    ^zsh -ic "cd ~/Documents/coviflex/coviflex-api && npm run start"
}
def bo [] {
    ^zsh -ic "cd ~/Documents/coviflex/coviflex-backoffice && npm run start"
}
def front [] {
    ^zsh -ic "cd ~/Documents/coviflex/coviflex-front && npm run start"
}
def workers [] {
    ^zsh -ic "cd ~/Documents/coviflex/coviflex-api && npm run start:jobWorkers:local"
}
def test [] {
    ^zsh -ic "cd ~/Documents/coviflex/coviflex-api && find ./src/__itests__ -type f -iname '*.spec.ts' | fzf --header 'Select file to launch for test' | xargs -I {} npm test -- {} --config ./jestConfig/jest.config.js"
}
def gql [] {
    ^zsh -ic "cd ~/Documents/coviflex/coviflex-api && npm run build:gql && cd ../coviflex-front && npm run generate:gql && cd ../coviflex-backoffice && npm run generate:gql"
}
alias db = ^pgcli postgresql://coviflex:coviflex@127.0.0.1:5433/coviflex

# Nvim
def na [] {
    ^zsh -ic "cd ~/Documents/coviflex/coviflex-api && nvim ."
}
def nb [] {
    ^zsh -ic "cd ~/Documents/coviflex/coviflex-backoffice && nvim ."
}
def nf [] {
    ^zsh -ic "cd ~/Documents/coviflex/coviflex-front && nvim ."
}
alias n = ^nvim .

# Utils
def ff [] {
    ^zsh -ic "fzf --style full --preview 'bat --color=always --style=numbers --line-range=:500 {}' --bind 'focus:transform-header:file --brief {}'"
}