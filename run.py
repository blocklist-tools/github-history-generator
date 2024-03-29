#!/usr/bin/env python3

import argparse
import sys
import os
import re
import subprocess
import json
import urllib.parse
import datetime
from pathlib import Path
from typing import Union

HOME = re.sub('/run\\.py$', '', os.path.realpath(__file__))
REPOS_PATH = f'{HOME}/.repos'
CLONE_PATH = None


def parse_args() -> sys.argv:
    parser = argparse.ArgumentParser()
    parser.add_argument('patterns', type=str, nargs='+', help='Path patterns to match')
    parser.add_argument('--username', type=str, help='Username')
    parser.add_argument('--repo', type=str, help='Repo name')
    parser.add_argument('--platform', type=str, help='Either github or gitlab', default='github')
    parser.add_argument('--branch', type=str, help='Branch name to walk', default='master')
    parser.add_argument('--name', type=str, help='Optional name to include in output file', default=None)
    args = parser.parse_args()
    if not args.patterns or len(args.patterns) < 1:
        parser.print_help()
        exit(1)
    return args


def clone_repo(platform: str, username: str, repo: str, branch: str):
    global CLONE_PATH
    CLONE_PATH = f'{REPOS_PATH}/{username}-{repo}'
    github_repo = repo_path(platform, username, repo)
    if not os.path.exists(REPOS_PATH):
        subprocess.Popen(['mkdir', '-p', REPOS_PATH])
    if not os.path.exists(CLONE_PATH):
        subprocess.Popen(['git', 'clone', github_repo, CLONE_PATH]).wait()
    subprocess.Popen(['git', 'fetch'], cwd=CLONE_PATH).wait()
    subprocess.Popen(['git', 'reset', '--hard'], cwd=CLONE_PATH).wait()
    subprocess.Popen(['git', 'clean', '-fd'], cwd=CLONE_PATH).wait()
    subprocess.Popen(['git', 'checkout', './'], cwd=CLONE_PATH).wait()
    subprocess.Popen(['git', 'checkout', '-f', branch], cwd=CLONE_PATH).wait()
    subprocess.Popen(['git', 'pull', '--force'], cwd=CLONE_PATH).wait()


def repo_path(platform: str, username: str, repo: str) -> str:
    if platform == 'gitlab':
        return f'https://gitlab.com/{username}/{repo}.git'
    return f'https://github.com/{username}/{repo}.git'


def find_matching_file(patterns: list) -> Union[None, str]:
    global CLONE_PATH
    for pattern in patterns:
        for path in Path(CLONE_PATH).rglob(pattern):
            return str(path).replace(CLONE_PATH, '', 1)
    return None


def get_file_hash(file: str) -> str:
    p = subprocess.Popen(['sha256sum', f'.{file}'], cwd=CLONE_PATH, stdout=subprocess.PIPE)
    output = p.communicate()[0].decode('utf-8').strip()
    return output.split()[0]


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
    return_code = subprocess.Popen(['git', 'checkout', 'HEAD~1'], cwd=CLONE_PATH, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL).wait()
    if return_code != 0:
        return False
    return True


def build_download_link(platform: str, user: str, repo: str, hash: str, file: str) -> str:
    encoded_file = urllib.parse.quote(file)
    if platform == 'gitlab':
        encoded_file = encoded_file.lstrip('/')
        return f'https://gitlab.com/{user}/{repo}/-/raw/{hash}/{encoded_file}'
    return f'https://raw.githubusercontent.com/{user}/{repo}/{hash}{encoded_file}'


def get_out_file_name(args):
    filename = f'{HOME}/out/{args.platform}-{args.username}-{args.repo}'
    if args.name:
        filename += '-' + args.name
    return filename + '-results.json'


def write_results(args, results):
    with open(get_out_file_name(args), 'w') as file:
        contents = {
            'platform': args.platform,
            'username': args.username,
            'repo': args.repo,
            'branch': args.branch,
            'name': args.name,
            'patterns': args.patterns,
            'created': datetime.datetime.utcnow().isoformat(),
            'versions': results
        }
        file.write(json.dumps(contents, indent=4))


def main():
    args = parse_args()
    clone_repo(args.platform, args.username, args.repo, args.branch)
    files = list()
    more_history = True
    previous_hash = None
    previous_epoch = None
    while more_history:
        details = get_commit_details()
        file = find_matching_file(args.patterns)
        if file:
            new_hash = get_file_hash(file)
            if previous_hash == new_hash:
                print(f'INFO: hash matches of previous entry')
                files[-1] = {
                    'url': build_download_link(args.platform, args.username, args.repo, details['commit_hash'], file),
                    'commitEpoch': details['commit_epoch']
                }
            elif details['commit_epoch'] == previous_epoch:
                print(f'INFO: Commit has the same epoch, skipping')
            else:
                print(f'INFO: New file hash: ${new_hash}')
                files.append({
                    'url': build_download_link(args.platform, args.username, args.repo, details['commit_hash'], file),
                    'commitEpoch': details['commit_epoch']
                })
            previous_hash = new_hash
            previous_epoch = details['commit_epoch']
        else:
            if args.platform == 'gitlab':
                url = f'https://gitlab.com/{args.username}/{args.repo}/-/tree/{details["commit_hash"]}'
            else:
                url = f'https://github.com/{args.username}/{args.repo}/tree/{details["commit_hash"]}'
            print(f'WARNING: No match found for commit {details["commit_hash"]}. See: {url}')
        more_history = walk_repo()
    files_by_date = {}
    for file in files:
        files_by_date[file['commitEpoch']] = file
    files = list(files_by_date.values())
    files = sorted(files, key=lambda version: version['commitEpoch'])   # sort by commitEpoch
    write_results(args, files)


if __name__ == "__main__":
    main()
