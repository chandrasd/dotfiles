function lazygit() {
  git add .
  git commit -m "$1"
  git push
}

# fzf into git branches
function git-fzf() {
    local branch
    branch=$(git for-each-ref --format='%(refname:short) %(committerdate:short) %(authorname) %(contents:subject)' refs/heads/ |
        column -t -s ' ' |
        fzf --preview "git log --oneline --graph --date=short --color=always --pretty='format:%C(auto)%cd %h%d %s' {1} | head -20" |
        awk '{print $1}') &&
    git checkout "$branch"
}

function kill_daemon() {
    local selection
    local pid
    local proc_name
    
    selection=$(ps -eo pid,comm | grep -E 'd$' | fzf --header="select daemon to kill")
    
    if [[ -z $selection ]]; then
        return 0
    fi
    
    pid=$(echo "$selection" | awk '{print $1}')
    proc_name=$(echo "$selection" | awk '{print $2}')
    
    print "about to kill PID: $pid | ($proc_name)"
    print -n "continue? (y/n): "
    read confirm
    
    if [[ $confirm =~ ^[yY]$ ]]; then
        if kill -9 $pid 2>/dev/null; then
            print "killed process $pid ($proc_name)"
        else
            print "failed to kill process ($proc_name)"
            return 1
        fi
    else
        print "operation cancelled"
    fi
}