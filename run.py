#!/usr/bin/env python3

import argparse
import sys
import os
import re
import subprocess
import json
from pathlib import Path
from typing import Union

HOME = re.sub('/run\\.py$', '', os.path.realpath(__file__))
REPOS_PATH = f'{HOME}/.repos'
CLONE_PATH = None


def parse_args() -> sys.argv:
    parser = argparse.ArgumentParser()
    parser.add_argument('patterns', type=str, nargs='+', help='Path patterns to match')
    parser.add_argument('--username', type=str, help='Github username')
    parser.add_argument('--repo', type=str, help='Github repo name')
    args = parser.parse_args()
    if not args.patterns or len(args.patterns) < 1:
        parser.print_help()
        exit(1)
    return args


def clone_repo(username: str, repo: str):
    global CLONE_PATH
    CLONE_PATH = f'{REPOS_PATH}/{username}-{repo}'
    github_repo = f'https://github.com/{username}/{repo}.git'
    if not os.path.exists(REPOS_PATH):
        subprocess.Popen(['mkdir', '-p', REPOS_PATH])
    if not os.path.exists(CLONE_PATH):
        subprocess.Popen(['git', 'clone', github_repo, CLONE_PATH]).wait()
    subprocess.Popen(['git', 'fetch'], cwd=CLONE_PATH).wait()
    subprocess.Popen(['git', 'checkout', './'], cwd=CLONE_PATH).wait()
    subprocess.Popen(['git', 'checkout', 'master'], cwd=CLONE_PATH).wait()
    subprocess.Popen(['git', 'pull'], cwd=CLONE_PATH).wait()


def find_matching_file(patterns: list) -> Union[None, str]:
    global CLONE_PATH
    for pattern in patterns:
        for path in Path(CLONE_PATH).rglob(pattern):
            return str(path).replace(CLONE_PATH, '', 1)
    return None


def get_commit_details() -> dict:
    p = subprocess.Popen(['git', 'rev-parse', 'HEAD'], cwd=CLONE_PATH, stdout=subprocess.PIPE)
    commit_hash = p.communicate()[0].decode('utf-8').strip()
    p = subprocess.Popen(['git', 'show', '-s', '--format=%ct', 'HEAD'], cwd=CLONE_PATH, stdout=subprocess.PIPE)
    commit_epoch = int(p.communicate()[0].decode('utf-8').strip())
    return {
        'commit_hash': commit_hash,
        'commit_epoch': commit_epoch
    }


def walk_repo():
    return_code = subprocess.Popen(['git', 'checkout', 'HEAD~1'], cwd=CLONE_PATH).wait()
    if return_code != 0:
        return False
    return True


def build_github_link(user, repo, hash, file) -> str:
    return f'https://raw.githubusercontent.com/{user}/{repo}/{hash}{file}'


def write_results(username, repo, results):
    with open(f'{HOME}/{username}-{repo}-results.json', 'w') as file:
        file.write(json.dumps(results, indent=4))


def main():
    args = parse_args()
    clone_repo(args.username, args.repo)
    files = list()
    more_history = True
    while more_history:
        details = get_commit_details()
        file = find_matching_file(args.patterns)
        if file:
            files.append({
                'url': build_github_link(args.username, args.repo, details['commit_hash'], file),
                'commit_epoch': details['commit_epoch']
            })
        else:
            print(f'WARNING: No match found for commit {details["commit_hash"]}')
        more_history = walk_repo()
    write_results(args.username, args.repo, files)


if __name__ == "__main__":
    main()
