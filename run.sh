#!/bin/bash
#set -e

HOME=$(dirname "$0")
REPO=
USER=
CURRENT_GIT_HASH=
CURRENT_GIT_EPOCH=

print_help() {
    echo
    echo "  Usage: run.sh [options] [Patterns]

    Options:
        -u [User]                        Github username of project (lightswitch05)
        -r [Repo]                        Github repo name of project (hosts)
        -h                               Show this help dialog
"
}

clone_repo() {
  if [[ ! -d "${REPO_PATH}" ]]; then
      echo "Cloning to ${REPO_PATH}"
      echo "Host *" >> /etc/ssh/ssh_config
      echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config
      mkdir -p "$(pwd)/.repos/"
      git clone "https://github.com/${USER}/${REPO}.git" "${REPO_PATH}"
  fi
  cd "${REPO_PATH}" || exit 1
  git fetch
  git checkout .
  git checkout master
  git pull
  set_git_vars
  cd "${HOME}" || exit 1
}

set_git_vars() {
  CURRENT_GIT_HASH=$(git rev-parse HEAD)
  CURRENT_GIT_EPOCH=$(git show -s --format=%ct HEAD)
}

find_matching_files() {
  PATHS=""
  for path in "$@"
  do
    arg=""
    if [ -n "${PATHS}" ]; then
        arg=" -o "
    fi
    PATHS+=" ${arg} -wholename ${path} "
  done

  cd "${REPO_PATH}" || exit 1
  MATCHING=$(find . -type f ${PATHS} | sed 's|^./||')
  cd "${HOME}" || exit 1
  echo "${MATCHING}"
}

build_github_link() {
  file="${1}"
  echo "https://raw.githubusercontent.com/${USER}/${REPO}/${CURRENT_GIT_HASH}/${file}"
}

while getopts 'hr:u:' flag; do
  case "${flag}" in
    u) USER="${OPTARG}" ;;
    r) REPO="${OPTARG}" ;;
    h) print_help
        exit 0 ;;
    *) print_help
        exit 1 ;;
  esac
done
shift $(( OPTIND - 1 ))

REPO_DIR="$(echo "${USER}-${REPO}" | sed 's/[:@.\/ ]/-/g')"
REPO_PATH="${HOME}/.repos/${REPO_DIR}"

clone_repo
matching_files=$(find_matching_files "$@")

urls=()
for file in ${matching_files}
do
  urls+=("$(build_github_link "${file}")")
done



