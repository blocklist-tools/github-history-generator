#!/usr/bin/env python3

import argparse
import sys
import os
import re
import json
import datetime
import urllib
import urllib.request

HOME = re.sub('/migration\\.py$', '', os.path.realpath(__file__))


def parse_args() -> sys.argv:
    parser = argparse.ArgumentParser()
    parser.add_argument('--id', type=str, help='ID of the list to migrate')
    args = parser.parse_args()
    if not args.id or len(args.id) < 1:
        parser.print_help()
        exit(1)
    return args


def load_versions(id: str, format: str):
    page = 0
    more_pages = True
    versions = []
    while more_pages:
        url = f'http://clayface.local:8181/blocklists/{id}/versions?page={page}'
        versions_page = json_download(url)
        versions.extend(versions_page)
        print(f"Page {page} has {len(versions_page)} versions")
        if len(versions_page) < 1:
            more_pages = False
        page += 1
    print(f"Loaded {len(versions)} versions")
    for i in range(len(versions)):
        version = versions[i]
        created_on = datetime.datetime.fromisoformat(version['createdOn'].replace('Z', '+00:00'))
        versions[i] = {
            "url": f'http://clayface.local:8181/versions/{version["id"]}/entries?format={format}',
            "commitEpoch": int(created_on.timestamp())
        }
    return sorted(versions, key=lambda version: version['commitEpoch'])   # sort by commitEpoch


def load_list_details(id: str):
    url = f'http://clayface.local:8181/blocklists/{id}'
    response = json_download(url)
    return {
        'name': re.sub(r"[^a-z0-9]+", '_', response['name'].lower()),
        'format': response['format']
    }


def get_out_file_name(list_name: str, id: str):
    return f'{HOME}/out/migration-{list_name}-{id}-results.json'


def write_results(list_name: str, id: str, results):
    file_name = get_out_file_name(list_name, id)
    with open(file_name, 'w') as file:
        contents = {
            'platform': 'migration',
            'name': id,
            'created': datetime.datetime.utcnow().isoformat(),
            'versions': results
        }
        file.write(json.dumps(contents, indent=4))
    print(f"Wrote: {file_name}")


def json_download(url):
    try:
        req = urllib.request.Request(url)
        req.add_header('User-Agent', 'robots-bypass-2342')
        with urllib.request.urlopen(req) as f:
            body = f.read().decode('utf-8')
        return json.loads(body)
    except Exception as e:
        print(f'Unable to download: {url}')
        raise e


def main():
    args = parse_args()
    list_details = load_list_details(args.id)
    versions = load_versions(args.id, list_details['format'])
    write_results(list_details['name'], args.id, versions)


if __name__ == "__main__":
    main()
