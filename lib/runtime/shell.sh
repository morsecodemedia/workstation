runtime_shell_initialize() {

    GPG_TTY="$(tty)"
    export GPG_TTY

    export EDITOR="vim"

    export PAGER="less"

    set -o vi

}