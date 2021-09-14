#!/bin/sh
set -e

docker-compose run --rm run --username lightswitch05 --repo hosts --name "d4440ca2-be75-4dd0-80ea-ddbefe1d0509" "ads-and-tracking-extended.txt" "*ads-and-tracking.txt"
docker-compose run --rm run --username lightswitch05 --repo hosts --name "cf95625f-2d92-43bb-a161-3f03982987af" "tracking-aggressive-extended.txt" "*tracking-aggressive.txt"
docker-compose run --rm run --username lightswitch05 --repo hosts --name "522f16bb-9cd9-4e94-b2b7-5aae18a82b52" "amp-hosts-extended.txt" "*amp-hosts.txt"
docker-compose run --rm run --username lightswitch05 --repo hosts --name "ce9c6ec5-13b5-4018-90e2-462b999362c2" "facebook-extended.txt" "*facebook.txt"
docker-compose run --rm run --username lightswitch05 --repo hosts --name "afee319e-f434-4abf-96ae-f580493707ed" "hate-and-junk-extended"
docker-compose run --rm run --username lightswitch05 --repo hosts --name "fa123cbc-1197-4447-af43-0f6e6fe12722" "dating-services-extended"

docker-compose run --rm run --username StevenBlack --repo hosts --name "67701e59-0496-4332-9586-aeb4db1cd097" "hosts"

docker-compose run --rm run --username AdAway --repo adaway.github.io --name "542f85d5-bc71-43ed-9430-1c820dd32059" "hosts" "hosts.txt"

# OISD Normal: 1467029f-0ace-4b3a-9a90-00f60475015b
docker-compose run --rm migration --id 1467029f-0ace-4b3a-9a90-00f60475015b

# OISD Light: 93b945d3-5005-4bd9-8faf-f2bb1a16831c
docker-compose run --rm migration --id  93b945d3-5005-4bd9-8faf-f2bb1a16831c

docker-compose run --rm run --username llacb47 --repo mischosts --name "2f8d3438-750b-45d2-84b4-655202eb11f9" "tiktok-block" "tiktok-hosts"
docker-compose run --rm run --username llacb47 --repo mischosts --name "91a41894-bfbc-4000-81be-178ca0691fdf" "blacklist"

docker-compose run --rm run --username PolishFiltersTeam --repo KADhosts --name "2087f7a9-e6b7-4e64-ac76-8072c5791e08" "KADhosts.txt"

# FadeMind add.Spam/hosts: 1366ea8c-11e3-4070-9e1c-0b889ccfcd54
docker-compose run --rm migration --id 1366ea8c-11e3-4070-9e1c-0b889ccfcd54

# WaLLy3K: Blacklist: 2964d90d-cdf5-422e-986d-609bf1dada23
docker-compose run --rm migration --id 2964d90d-cdf5-422e-986d-609bf1dada23

docker-compose run --rm run --username matomo-org --repo referrer-spam-blacklist --name "e84113ae-8ee8-423c-8efe-78468dc5ed85" "spammers.txt"

# someonewhocares: 01f605f6-8a7d-4d78-9ffa-780a69924271
docker-compose run --rm migration --id 01f605f6-8a7d-4d78-9ffa-780a69924271

docker-compose run --rm run --username vokins --repo yhosts --name "cb919bdb-9842-408a-ace1-bdf71d5ce3e4" "hosts" "hosts.txt"

# Winhelp2002 MVPS: af813f51-0846-47d0-98a4-744f4652fa48
docker-compose run --rm migration --id af813f51-0846-47d0-98a4-744f4652fa48

docker-compose run --rm run --branch gh-pages --username neofelhz --repo neohosts --name "ac25a759-509c-4290-9e5c-dd5f60f4963f" "basic/hosts"

docker-compose run --rm run --branch gh-pages --username neofelhz --repo neohosts --name "76c109c7-7e28-4c81-9977-762019642d7f" "full/hosts"

docker-compose run --rm run --username RooneyMcNibNug --repo pihole-stuff --name "7572fce7-b6a6-42fd-9855-62e302c430b3" "SNAFU.txt"

# Adguard: DNS 8ebd22b6-81a7-4f6e-8032-6f7ad281b9b7
docker-compose run --rm migration --id 8ebd22b6-81a7-4f6e-8032-6f7ad281b9b7

# LanikSJ: Admiral Anti-Adblock : cb51c11f-0086-422f-a2ea-0313f910ec6e
docker-compose run --rm migration --id cb51c11f-0086-422f-a2ea-0313f910ec6e

docker-compose run --rm run --username anudeepND --repo blacklist --name "1d28491c-6892-4615-974f-0f546da72474" "adservers.txt" "adserverhost.txt"

docker-compose run --rm run --username anudeepND --repo whitelist --name "28a8cefc-9b7c-4f71-bc1e-38a6242d5840" "domains/whitelist.txt" "whitelist.txt"

# Disconnect: Ads : c18393b3-166c-4fd5-8726-ae8ced850dbb
docker-compose run --rm migration --id c18393b3-166c-4fd5-8726-ae8ced850dbb

# Easylist 14163f82-33d8-4d41-9d3e-4d27f9efdcef
docker-compose run --rm migration --id 14163f82-33d8-4d41-9d3e-4d27f9efdcef

# Peter Lowe: Adservers 6448c43b-b9ba-4629-bd61-8659840f4f38
docker-compose run --rm migration --id 6448c43b-b9ba-4629-bd61-8659840f4f38

# Fademind  Unchecky Ads eb752e59-9a69-4406-a120-dcaf054c3e4e
docker-compose run --rm migration --id eb752e59-9a69-4406-a120-dcaf054c3e4e

docker-compose run --rm run --username bigdargon --repo hostsVN --name "8ab2c1ce-2a58-4db8-8db6-17b1bce71450" "hosts"

docker-compose run --rm run --username jdlingyu --repo ad-wars --name "cef916f9-7884-48ed-949f-e7af63b7447d" "hosts"

# Easylist: easyprivacy 48d1abcb-b79d-4100-bab6-3424c3774d2d
docker-compose run --rm migration --id 48d1abcb-b79d-4100-bab6-3424c3774d2d

# Fabrice Prigent: Ads: 9601d9dd-4969-420d-a20d-c66e7fd24933
docker-compose run --rm migration --id 9601d9dd-4969-420d-a20d-c66e7fd24933

docker-compose run --rm run --platform gitlab --username quidsup --repo notrack-blocklists --name "4a91a237-36db-40f4-a818-b3eb7e13939b" "notrack-blocklist.txt"

# Fademind 2o7 Network Trackers db73427f-daae-47b7-b36c-461b93597151
docker-compose run --rm migration --id db73427f-daae-47b7-b36c-461b93597151

docker-compose run --rm run --username crazy-max --repo WindowsSpyBlocker --name "13caacd5-9a93-43eb-97c8-ed02cc70810a" "data/hosts/spy.txt" "data/hosts/win10/spy.txt" "data/hosts/win81/spy.txt" "hosts/windows10_spy.txt" "hosts/hostsBlockWindowsSpy.txt" "hostsBlockWindowsSpy.txt"

docker-compose run --rm run --username crazy-max --repo WindowsSpyBlocker --name "ceb9a000-f313-449c-9d68-367aabf50261" "data/hosts/update.txt" "data/hosts/win10/update.txt" "data/hosts/win81/update.txt" "hosts/windows10_update.txt" "hosts/hostsBlockWindowsUpdate.txt" "hostsBlockWindowsUpdate.txt"

docker-compose run --rm run --username crazy-max --repo WindowsSpyBlocker --name "6635d010-0924-47fb-853c-30e32198000c" "data/hosts/extra.txt" "data/hosts/win10/extra.txt" "data/hosts/win81/extra.txt" "hosts/windows10_extra.txt" "hosts/hostsBlockWindowsExtra.txt" "hostsBlockWindowsExtra.txt"

# Geoffrey Frogeye: First-Party Trackers 4759abf8-f4ee-4bbc-b211-3d50c193dee1
docker-compose run --rm migration --id 4759abf8-f4ee-4bbc-b211-3d50c193dee1

#Geoffrey Frogeye: Multi-Party Trackers: 98ca0971-34b8-42d0-b67c-881f79baf47f
docker-compose run --rm migration --id 98ca0971-34b8-42d0-b67c-881f79baf47f

docker-compose run --rm run --username Perflyst --repo PiHoleBlocklist --name "4c25278a-7261-448c-97d7-e29d1f8f6d31" "android-tracking.txt"

docker-compose run --rm run --username Perflyst --repo PiHoleBlocklist --name "e06d1c88-9175-4675-b8ad-ecd4d5ea8565" "SmartTV.txt"

docker-compose run --rm run --username Perflyst --repo PiHoleBlocklist --name "caff854d-f482-498c-a4ad-6186e7ea9bd4" "AmazonFireTV.txt"

docker-compose run --rm run --username DandelionSprout --repo adfilt --name "1e7451ee-c1dd-4a11-b475-20a95858fb2d" "Alternate versions Anti-Malware List/AntiMalwareHosts.txt"

docker-compose run --rm run --username davidonzo --repo Threat-Intel --name "59073d0b-3882-49b0-98b2-a05ed6bf60f3" "lists/latestdomains.txt"

# Disconnect: Malvertising a8428cd2-e83d-43e4-9cbc-de1928d98120
docker-compose run --rm migration --id a8428cd2-e83d-43e4-9cbc-de1928d98120

# Fabrice Prigent: Cryptojacking b4bf805e-024c-4f26-ae14-38fb69207394
docker-compose run --rm migration --id b4bf805e-024c-4f26-ae14-38fb69207394

# Phishing Army: Extended Blocklist fb0f255a-9325-4f00-b05f-4157eec4290b
docker-compose run --rm migration --id fb0f255a-9325-4f00-b05f-4157eec4290b

docker-compose run --rm run --platform=gitlab --username quidsup --repo notrack-blocklists --name "e7ee4493-1c7c-4e5f-908d-cb36d0483627" "notrack-malware.txt"

# Shalla: Malicious f88d90a7-8b69-496a-a84f-905098430e18
docker-compose run --rm migration --id f88d90a7-8b69-496a-a84f-905098430e18

docker-compose run --rm run --username Spam404 --repo lists --name "aeda1bce-2703-44c9-b6bf-e7005e2388f5" "main-blacklist.txt"

# Fademind: Risky Hosts 4b0d2a99-65f9-4600-87c0-88181a683b54
docker-compose run --rm migration --id 4b0d2a99-65f9-4600-87c0-88181a683b54

# URLhaus: Malicious URL blocklist ba1d7984-ac60-4e67-a382-43eb460c1f6d
docker-compose run --rm migration --id ba1d7984-ac60-4e67-a382-43eb460c1f6d

# Fabrice Prigent: Malware bc18072e-b075-4696-bdea-0b94376ef3b8
docker-compose run --rm migration --id bc18072e-b075-4696-bdea-0b94376ef3b8

docker-compose run --rm run --username HorusTeknoloji --repo TR-PhishingList --name "2579aa98-8de9-43c2-8769-20c66709c3b5" "url-lists.txt"

docker-compose run --rm run --platform gitlab --username ZeroDot1 --repo CoinBlockerLists --name "bee9c703-b471-46ce-947a-b8f3e814d9c3" "hosts_browser" "hosts"

docker-compose run --rm run --username chadmayfield --repo my-pihole-blocklists --name "fab0cf06-f5b5-4288-a9b2-cee1b968c658" "pi_blocklist_porn_all.list"

docker-compose run --rm run --username chadmayfield --repo my-pihole-blocklists --name "8d613288-e9ac-4d74-b9ba-288a902b7c7d" "pi_blocklist_porn_top1m.list"

docker-compose run --rm run --username anudeepND --repo blacklist --name "6368a1d2-20f9-4423-8fb8-0f622f471f1a" "facebook.txt"

docker-compose run --rm run --username StevenBlack --repo hosts --name "178a40e4-ad09-4be9-a605-4e2207a1de77" "data/StevenBlack/hosts"

docker-compose run --rm run --username mitchellkrogza --repo Badd-Boyz-Hosts --name "178a40e4-ad09-4be9-a605-4e2207a1de77" "hosts"

docker-compose run --rm run --username tiuxo --repo hosts --name "9c74ae92-0fd4-4b33-9088-3bfe72ca8720" "ads"

docker-compose run --rm run --username tiuxo --repo hosts --name "d3e35ecf-b208-4060-b763-cbed67048abe" "porn"

docker-compose run --rm run --username Sinfonietta --repo hostfiles --name "8e08d424-7d67-4a40-a953-4f865b924b3a" "pornography-hosts"

docker-compose run --rm run --username Sinfonietta --repo hostfiles --name "214dbd95-8f9f-4778-9b24-52a25ae3f884" "social-hosts"

docker-compose run --rm run --username Sinfonietta --repo hostfiles --name "88b11b63-e6bc-4e1e-a6b2-e6b42146f701" "gambling-hosts"

docker-compose run --rm run --username Clefspeare13 --repo pornhosts --name "517994ca-b2ab-42a1-9524-6b44d402da1b" "download_here/0.0.0.0/hosts" "0.0.0.0/hosts" "hosts"

docker-compose run --rm run --username marktron --repo fakenews --name "901339ff-fe52-4326-a97b-71a9d0516693" "fakenews"

# Cyber Threat Coalition: Vetted Domain 913672ce-58ba-45e1-b851-68cdb99572ec
docker-compose run --rm migration --id 913672ce-58ba-45e1-b851-68cdb99572ec

docker-compose run --rm run --username jerryn70 --repo GoodbyeAds --name "120524b2-d9e9-4325-8f38-ab5a987af58c" "GoodbyeAds.txt"

# EnergizedProtection: Spark 26fa5575-9c25-42b6-a2cf-82590ecad1ce
docker-compose run --rm migration --id 26fa5575-9c25-42b6-a2cf-82590ecad1ce

# EnergizedProtection: Blu 2f24cc50-3753-43e9-b208-1ce6d6db8a52
docker-compose run --rm migration --id 2f24cc50-3753-43e9-b208-1ce6d6db8a52

# EnergizedProtection: Blu GO 0f7d3c1b-6cb2-41fc-8497-c7c7a3f760ed
docker-compose run --rm migration --id 0f7d3c1b-6cb2-41fc-8497-c7c7a3f760ed

# EnergizedProtection: Basic b90e245a-61ef-4dc4-a9cb-16b9e29b57f1
docker-compose run --rm migration --id b90e245a-61ef-4dc4-a9cb-16b9e29b57f1

# EnergizedProtection: Porn f1d1420c-215c-40d4-a9fd-db1b5bbf25d1
docker-compose run --rm migration --id f1d1420c-215c-40d4-a9fd-db1b5bbf25d1

# EnergizedProtection: Ultimate 82596c45-cdbe-4cde-b0b7-1fac29f04ba5
docker-compose run --rm migration --id 82596c45-cdbe-4cde-b0b7-1fac29f04ba5

# EnergizedProtection: Unified 459772f6-e11d-4a04-9acd-10a112fdfba9
docker-compose run --rm migration --id 459772f6-e11d-4a04-9acd-10a112fdfba9

# EnergizedProtection: Xtreme 3d15109b-eeab-4704-ad30-78b2bd7d86a1
docker-compose run --rm migration --id 3d15109b-eeab-4704-ad30-78b2bd7d86a1

# EnergizedProtection: Regional b3a7b715-8a14-467e-9cda-710c47fe9fdd
docker-compose run --rm migration --id b3a7b715-8a14-467e-9cda-710c47fe9fdd

# EnergizedProtection: Social c791e72b-624c-4224-8709-76d2edb349b3
docker-compose run --rm migration --id c791e72b-624c-4224-8709-76d2edb349b3

# EnergizedProtection: Porn Lite f9159025-71fd-4f7c-98a1-cab06935e5ce
docker-compose run --rm migration --id f9159025-71fd-4f7c-98a1-cab06935e5ce

# EnergizedProtection: Porn Lite f9159025-71fd-4f7c-98a1-cab06935e5ce
docker-compose run --rm migration --id f9159025-71fd-4f7c-98a1-cab06935e5ce

docker-compose run --rm run --username paulgb --repo BarbBlock --name "b70b5b11-a725-4f53-8c7d-339d6e323fbf" "blacklists/domain-list.txt" "blacklists/hosts-file.txt"

# AZORult Tracker: Domain List 636fd6c2-0762-431c-90d2-de5924cf7aa5
docker-compose run --rm migration --id 636fd6c2-0762-431c-90d2-de5924cf7aa5

docker-compose run --rm run --username blocklistproject --repo lists --name "1f2274e9-b1ac-491a-a79f-813305fb318e" "ads.txt"

docker-compose run --rm run --username blocklistproject --repo lists --name "76f7138b-fd58-4c3c-95b8-3b71c036af69" "tracking.txt"

docker-compose run --rm run --username blocklistproject --repo lists --name "8ec21f78-d11d-4d21-b001-d35cc3641b13" "malware.txt"

docker-compose run --rm run --username blocklistproject --repo lists --name "69dc301a-7620-4eca-b513-39ec2559cb62" "phishing.txt"

docker-compose run --rm run --username blocklistproject --repo lists --name "bd3069bf-8620-4db3-9331-723560167fe1" "gambling.txt"

docker-compose run --rm run --username blocklistproject --repo lists --name "29ad72a8-359e-4b92-aa65-bfd64bf0dc49" "facebook.txt"

docker-compose run --rm run --username blocklistproject --repo lists --name "01541fa6-0678-4da2-8aa3-6268448ad897" "abuse.txt"

docker-compose run --rm run --username blocklistproject --repo lists --name "e0302610-4444-4774-ba3e-a19ad7f2ea11" "crypto.txt"

docker-compose run --rm run --username blocklistproject --repo lists --name "3b957561-df82-49cc-a574-cb1fde80bf9b" "drugs.txt"

docker-compose run --rm run --username blocklistproject --repo lists --name "2bb06ec6-4e91-42bc-9645-4741c2a8669f" "fraud.txt"

docker-compose run --rm run --username blocklistproject --repo lists --name "c6b1420e-dbbe-49bd-a790-6d72707cf97b" "piracy.txt"

docker-compose run --rm run --username blocklistproject --repo lists --name "0a3dd008-af85-4859-9cda-3d74bb10acb7" "porn.txt"

docker-compose run --rm run --username blocklistproject --repo lists --name "86d91474-1316-4f41-a198-54806d6a5e82" "ransomware.txt"

docker-compose run --rm run --username blocklistproject --repo lists --name "f7f9e8dd-d121-4e3d-b271-5f8ed189f223" "redirect.txt"

docker-compose run --rm run --username blocklistproject --repo lists --name "aaeea6b6-253a-4686-9158-cf10b4fcce29" "scam.txt"

docker-compose run --rm run --username blocklistproject --repo lists --name "73537b3e-ba96-4734-a283-b91c94998164" "torrent.txt"

# hBlock: Hosts Domains a237508f-f0bf-4709-b626-67d2bbc801f8
docker-compose run --rm migration --id a237508f-f0bf-4709-b626-67d2bbc801f8

# Disconnect: Tracking 6a36a82f-56e1-4fa8-9988-831b5d834734
docker-compose run --rm migration --id 6a36a82f-56e1-4fa8-9988-831b5d834734

docker-compose run --rm run --username Yhonay --repo antipopads --name "7840de38-a1b5-4508-bd6c-5fbff1512c24" "hosts"

docker-compose run --rm run --username infinitytec --repo blocklists --name "d827ebe0-a8b1-48fa-8bf6-7d3c1673f561" "ads-and-trackers.txt"

docker-compose run --rm run --username infinitytec --repo blocklists --name "ae10e18f-29e3-4f5d-9330-06af34859412" "scams-and-phishing.txt"

docker-compose run --rm run --username infinitytec --repo blocklists --name "d0ca74e6-b48d-4bf3-8107-60346d9a9637" "medicalpseudoscience.txt"

docker-compose run --rm run --username infinitytec --repo blocklists --name "7cfee480-0dd6-485c-bd12-0b8a776950eb" "possibilities.txt"

# KriskIntel: Malicious Domains 63700e08-1e02-480a-ab98-15028392e129
docker-compose run --rm migration --id 63700e08-1e02-480a-ab98-15028392e129

# KriskIntel: Covid-19 Phishing Feed 8a6ca4dd-b84d-4653-a6e0-5d35e11a3fa5
docker-compose run --rm migration --id 8a6ca4dd-b84d-4653-a6e0-5d35e11a3fa5

# KriskIntel: Ransomware Feeds e6706f3c-b520-44c8-bec6-ab128fc35e36
docker-compose run --rm migration --id e6706f3c-b520-44c8-bec6-ab128fc35e36

docker-compose run --rm run --username bjornstar --repo hosts --name "5b94b549-1f07-4229-bd65-cfb8b64e8343" "hosts"

docker-compose run --rm run --username stamparm --repo blackbook --name "4d520159-b3a9-41ad-b414-67c8356fe50d" "blackbook.txt"

docker-compose run --rm run --username yous --repo YousList --name "6aca4c7d-0d96-4c62-8e3d-7d0aa8f644f0" "hosts.txt"

docker-compose run --rm run --username ilpl --repo ad-hosts --name "2b6e809a-6694-4bd7-9267-8a6289518fbe" "hosts"

# Socram: Not on my shift! 99e739aa-1ec4-4384-890d-eea9c1980ab9
docker-compose run --rm migration --id 99e739aa-1ec4-4384-890d-eea9c1980ab9

docker-compose run --rm run --username neodevpro --repo neodevhost --name "998473f2-1b0d-4308-a487-f5395d8fa705" "host" "hosts.txt"

docker-compose run --rm run --username badmojr --repo 1Hosts --name "c6500d29-38a2-448f-ab44-9c7ebcd0390b" "mini/domains.txt"

docker-compose run --rm run --username badmojr --repo 1Hosts --name "ce8751a1-0b42-4f08-b5d2-d1bc6b856e04" "Lite/domains.txt"

docker-compose run --rm run --username badmojr --repo 1Hosts --name "d414c31a-3c55-4a84-bac5-3c3940e70d4c" "Pro/domains.txt"

docker-compose run --rm run --username badmojr --repo 1Hosts --name "98f8c690-db7d-4112-a233-8f62111b0b62" "Xtra/domains.txt"

docker-compose run --rm run --username stamparm --repo aux --name "b171bc46-f2c0-4690-9ee6-476937b44292" "maltrail-malware-domains.txt"

docker-compose run --rm run --username DRSDavidSoft --repo additional-hosts --name "480f9d7a-1db0-46fe-bad1-223d18683060" "domains/blacklist/adservers-and-trackers.txt"
docker-compose run --rm run --username DRSDavidSoft --repo additional-hosts --name "c071c638-ea8d-4bb6-8716-f0f5247ea4be" "domains/blacklist/activation.txt"
docker-compose run --rm run --username DRSDavidSoft --repo additional-hosts --name "cfcfad60-70ab-4115-8799-33b217004c52" "domains/blacklist/fake-domains.txt"
docker-compose run --rm run --username DRSDavidSoft --repo additional-hosts --name "479ad4e1-103b-4f68-bc0c-9bdc3118d4f5" "domains/blacklist/search-blacklist.txt"
docker-compose run --rm run --username DRSDavidSoft --repo additional-hosts --name "3b6e7dbd-3cca-4ba3-8202-ef7387be4cdb" "domains/blacklist/unwanted-iranian.txt"

docker-compose run --rm run --username autinerd --repo anti-axelspringer-hosts --name "24d51b02-fbcc-491e-bfb5-4f34b7d8057b" "axelspringer-hosts"

docker-compose run --rm run --username hell-sh --repo Evil-Domains --name "924f982f-09fb-487b-a0fb-feaa6ff45570" "evil-domains.txt" "output/domains.txt"


