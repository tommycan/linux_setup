
###########################################################
# navigation
###########################################################
# history search
if [[ $- == *i* ]]
then
	bind '"\e[A": history-search-backward'
	bind '"\e[B": history-search-forward'
fi

# cd history
[ -e ~/scripts/acd_func.sh ] && source ~/scripts/acd_func.sh

mkdircd () {
	mkdir -p "$1" && cd "$1"
}

# case insenitive
bind 'set completion-ignore-case on'

# alias
alias h='history'
alias o='xdg-open'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias dated='date +%Y-%m-%d\ %H:%M:%S.%N'
alias tmux='tmux -u $@'

###########################################################
# env
###########################################################
export VISUAL=vim
export EDITOR="$VISUAL"
export PATH="$PATH:$HOME/bin"

###########################################################
# pyenv
###########################################################
# https://github.com/pyenv/pyenv  
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

###########################################################
# unsorted
###########################################################
my-repo-reset() {
    repo forall --ignore-missing -e -j24 -c 'git reset --hard --quiet && git clean -fdx'
    get_non_git_files.py --remove
    repo sync --force-sync
}

prettyjson_f() {
    python -m json.tool "$1"
}

prettyjson_s() {
    echo "$1" | python -m json.tool
}

picocom0g() { picocom -b 115200 /dev/ttyUSB0 -g "pico0_$(date '+%Y%m%d_%H%M%S').log" ; }
picocom1g() { picocom -b 115200 /dev/ttyUSB1 -g "pico1_$(date '+%Y%m%d_%H%M%S').log" ; }

###########################################################
# cpufreq stuff
###########################################################
alias watch_cpu_freq="sudo watch -n1 cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_cur_freq"
alias get_cpu_gov="cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor"

set_cpu_gov()
{
    gov=$1
    # Usage: Run either of:
    #    * set_cpu_gov performance
    #    * set_cpu_gov powersave
    # Your system might have more available governors
    # than performance and powersave, to list them run "cpufreq-info"

    for (( i = 0; i<$(nproc --all); i++));
    do
        sudo cpufreq-set -c $i -g $gov;
    done
    echo "All set"
    get_cpu_gov
}

###########################################################
# confidential
###########################################################
[[ -f ~/.bash_haleytek ]] && source ~/.bash_haleytek
