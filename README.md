This project is meant as a playground to interact with juice-shop, which is an insecure website for security training. The docker-compose file contains two services, the juice-shop website and kali-linux container, that are connected with each other.

To start, clone this repo, open a terminal in the repo location and start up the docker compose services:
```BASH
docker-compose up
```

Next, open a shel in the kali container, the commands.sh contains a simplified command to do so:
```BASH
source commands.sh
kali-shell
```

In it, you can explore the network to which the kali container is connected.
```BASH
nmap -A -sV -p1-10000 $(hostname -I | awk '{print $1}' | awk -F. '{print $1"."$2"."$3".0"}')/24
```

or explore payloads
```BASH
wfuzz -c -z file,/usr/share/wfuzz/wordlist/general/common.txt --hc 404 juice-shop:3000/FUZZ
```