nslookup google.com

top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4"%"}'

free -h

telnet localhost 9000
