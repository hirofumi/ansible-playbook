#!/bin/sh

set -e

agent=""

prepare_ssh_agent() {
    if [ -z "$agent" ]; then
        agent="$(ssh-agent)"
        eval "$agent"
    fi
}

while :; do
    case "$1" in
        --ssh-add)
            prepare_ssh_agent
            ssh-add
            ;;
        --ssh-add=/*)
            prepare_ssh_agent
            ssh-add "${1#--ssh-add=}"
            ;;
        --ssh-add=*)
            prepare_ssh_agent
            ssh-add ~/.ssh/"${1#--ssh-add=}"
            ;;
        *)
            break
            ;;
    esac
    shift
done

ansible-playbook "$@"
