nslookup https://google.com

top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4"%"}'

free -h

telnet 192.168.1.30 9000
