
###########################################################
# navigation
###########################################################
# history search
if [[ $- == *i* ]]
then
	bind '"\e[A": history-search-backward'
	bind '"\e[B": history-search-forward'
fi


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
alias .......='cd ../../../../../..'
alias ........='cd ../../../../../../..'
alias nice-date='date +%Y-%m-%d\ %H:%M:%S.%N'
alias -g long-date='date +%Y%m%d_%H%M%S_%N'
alias -g short-date='date +%Y%m%d_%H%M%S'
alias tmux='tmux -u $@'

###########################################################
# env
###########################################################
export VISUAL=vim
export EDITOR="$VISUAL"
[[ -d $HOME/bin ]] && export PATH="$PATH:$HOME/bin"
[[ -d $HOME/.local/bin ]] && export PATH="$PATH:$HOME/.local/bin"

###########################################################
# pyenv
###########################################################
if [[ -d "$HOME/.pyenv" ]]; then
    # https://github.com/pyenv/pyenv
    enable-pyenv() {
        export PYENV_ROOT="$HOME/.pyenv"
        export PATH="$PYENV_ROOT/bin:$PATH"
        eval "$(pyenv init --path)"
        eval "$(pyenv init -)"
        eval "$(pyenv virtualenv-init -)"
    }
fi

###########################################################
# find
###########################################################

function ccgrep()
{
    find . -name .repo -prune -o -name .git -prune -o -name out -prune -o -type f \( -name '*.c' -o -name '*.cc' -o -name '*.cpp' -o -name '*.h' -o -name '*.hpp' \) \
        -exec grep --color -n "$@" {} +
}

function cmakegrep()
{
    find . -name .repo -prune -o -name .git -prune -o -name out -prune -o -type f \( -name 'CMakeLists.txt' \) \
        -exec grep --color -n "$@" {} +
}

function bpgrep()
{
    find . -name .repo -prune -o -name .git -prune -o -name out -prune -o -type f \( -name 'Android.bp' -o -name 'Android.mk' \) \
        -exec grep --color -n "$@" {} +
}

function sgrep()
{
    find . -name .repo -prune -o -name .git -prune -o  -type f -iregex '.*\.\(c\|h\|cc\|cpp\|hpp\|S\|java\|xml\|sh\|mk\|aidl\|vts\)' \
        -exec grep --color -n "$@" {} +
}


alias cd-git-root='cd $(git rev-parse --show-toplevel)'
alias cd-repo-root='cd $(repo --show-toplevel)'
alias cd-manifest-root='cd $(repo --show-toplevel)/.repo/manifests'

alias cd-qnx-cvendor='cd $(repo --show-toplevel)/qnx/apps/qnx_ap/cvendor'
alias cd-qnx-volvocars='cd $(repo --show-toplevel)/qnx/apps/qnx_ap/cvendor/volvocars'
alias cd-qnx-haleytek='cd $(repo --show-toplevel)/qnx/apps/qnx_ap/cvendor/haleytek'
alias cd-qnx-haleytek-host-gueset-interfaces='cd $(repo --show-toplevel)/qnx/apps/qnx_ap/cvendor/haleytek/common/host-guest-interfaces'

alias cd-android-haleytek-audio='cd $(repo --show-toplevel)/android/vendor/haleytek/hardware/audio'
alias cd-android-haleytek-interfaces='cd $(repo --show-toplevel)/android/vendor/haleytek/hardware/interfaces'
alias cd-android-haleytek-host-guest-interfaces='cd $(repo --show-toplevel)/android/vendor/haleytek/hardware/common/host-guest-interfaces'


prettyjson_f() {
    python -m json.tool "$1"
}

prettyjson_s() {
    echo "$1" | python -m json.tool
}

picocomg() {
    if [[ -z $1 ]]; then
        echo "Expected one argument <INDEX> to use appropriate USB devices as /dev/ttyUSB<INDEX>, as for instance"
        echo "picocomg 0"
        echo "picocomg 1"
        return -1
    fi
    idx=$1
    picocom -b 115200 /dev/ttyUSB${idx} -g "pico${idx}_$(date '+%Y%m%d_%H%M%S').log"
}

picocom0g() { picocomg 0; }
picocom1g() { picocomg 1; }

run_with_args() {
    workspace_dir=`get-repo-root`
    echo "Workspace dir: ${workspace_dir}"
    if [[ -d "${workspace_dir}" ]]; then
        invoke_cmd="${workspace_dir}/$@"
        echo "Invocation command: ${invoke_cmd}"
        ${invoke_cmd}
        # if [[ -f "${invocation_command}" ]]; then
        #     echo "Execute: ${script_path}"
        # else
        #     "Failed to execute: ${script_path}"
        #     return -1
        # fi
    else
        "Failed to find workspace root: ${workspace_dir}"
        return -1
    fi
}

qnx_ssh_over_adb () {
    script_rel_path="qnx/apps/qnx_ap/vendor/volvocars/audio/utils/qnx_ssh_over_adb/ssh_tunnel.sh"
    run_with_args "${script_rel_path} $@"
}

quick_qnx_build_deploy () {
    script_rel_path="qnx/apps/qnx_ap/vendor/volvocars/audio/utils/quick_qnx_build_deploy/quick_qnx_build_deploy.sh"
    run_with_args "${script_rel_path} $@"
}

############################################################
# cpufreq stuff
############################################################
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

############################################################
# cd history
############################################################
[[ -f ~/.bash_acd_func ]] && source ~/.bash_acd_func

############################################################
# haleytek specific
############################################################
[[ -f ~/.bash_haleytek ]] && source ~/.bash_haleytek
