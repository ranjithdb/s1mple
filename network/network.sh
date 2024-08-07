nslookup guvi.in

top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4"%"}'

free -h

telnet guvi.com 9000
