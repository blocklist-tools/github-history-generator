# GitHub History Generator (Also GitLab)

Clones a given repo, and walks the history looking for matching filename patterns
and generates a JSON file containing URLs to each version of the file (excludes commits
where no changes were made to the give file). Patterns are tried in order given,
the first matching file will be used for each commit.

### Example Output

```json
{
  "platform": "github",
  "username": "anudeepND",
  "repo": "blacklist",
  "branch": "master",
  "name": "adservers",
  "patterns": [
    "adservers.txt"
  ],
  "created": "2021-07-17T01:56:11.712110",
  "versions": [
    {
      "url": "https://raw.githubusercontent.com/anudeepND/blacklist/a70c0b4e6706994ff8258b915e08bef2dd9fea4f/adservers.txt",
      "commitEpoch": 1623517387
    },
    {
      "url": "https://raw.githubusercontent.com/anudeepND/blacklist/91267d5d83dde8862eac9a0fd96502278ff8a565/adservers.txt",
      "commitEpoch": 1607877906
    },
    {
      "url": "https://raw.githubusercontent.com/anudeepND/blacklist/34db3679331e7b0ed55218269e446d567ae76b54/adservers.txt",
      "commitEpoch": 1607877471
    }
  ]
}
```


### Example Commands

```
docker-compose run --rm run --username lightswitch05 --repo hosts --name "ads-and-tracking" "ads-and-tracking-extended.txt" "*ads-and-tracking.txt"
docker-compose run --rm run --username StevenBlack --repo hosts --name "ad-hoc-list" "*/StevenBlack/hosts"
docker-compose run --rm run --username anudeepND --repo blacklist --name "adservers" "adservers.txt"
docker-compose run --rm run --username dead-hosts --repo domain_blocklist_web_dbl-oisd-nl --name "oisd" "origin.list"
```

### Now works with gitlab as well

```
docker-compose run --rm run --platform gitlab --username The_Quantum_Alpha --repo the-quantum-ad-list "*/The_Quantum_Ad-List.txt"
```
