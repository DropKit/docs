#!/usr/bin/env bash
# usage: publish-gh -v 0.0.1 -u junwei0117

set -o errexit
set -o pipefail

check_env() {
    if [[ ! -e "./website/node_modules/.bin/docusaurus-version" ]]; then
        echo "
**ERROR**
docusaurus related commands not found under [website/node_modules/.bin]
Please install dependencies for this project:
    1. install node if you don't have;
    2. install dependencies: cd website && npm install.
"
        exit 1
    fi
}

command::publish-gh() {
    local version=()
    local user=()
    local current_opt=""

    while :; do
        case ${1:-notset} in
            -v|--version)
                current_opt="version"
                ;;
            -u|--user)
                current_opt="user"
                ;;
            notset)
                break
                ;;
            *)
              case ${current_opt} in
                  version)
                      version+=("$1")
                      ;;
                  user)
                      user+=("$1")
                      ;;
              esac
              ;;
        esac
        shift
    done

    # print version and user
    echo "Version: ${version}"
    echo "User: ${user}"

    # publish current docs
    cd website

    GIT_USER=${user} \
    CURRENT_BRANCH=master \
    USE_SSH=true \
    yarn run publish-gh-pages

    # commit and push
    cd ..
    git add .
    git commit -m "chore(publish): published ${version} docs by [${user}]"
    git push origin master
}

usage() {
    echo "
Usage: publish-gh -v <version> -u <user>

Options:
    version: semantic version, e.g. 0.0.1
    user:    username who updates the docs, e.g. junwei0117
" 1>&2; exit 1;
}

main() {
    check_env
    if [[ $# -ne 4 ]]; then
        usage
    fi
    command::publish-gh "$@"
}

main "$@"