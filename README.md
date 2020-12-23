
```
docker-compose run --rm run --username lightswitch05 --repo hosts "ads-and-tracking-extended.txt" "*ads-and-tracking.txt"
docker-compose run --rm run --username StevenBlack --repo hosts "*/StevenBlack/hosts"
docker-compose run --rm run --username anudeepND --repo blacklist "adservers.txt"
docker-compose run --rm run --username dead-hosts --repo domain_blocklist_web_dbl-oisd-nl "origin.list"
```

### Now works with gitlab as well

```
docker-compose run --rm run --platform gitlab --username The_Quantum_Alpha --repo the-quantum-ad-list "*/The_Quantum_Ad-List.txt"
```
