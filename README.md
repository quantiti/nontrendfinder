### Finding windows computer which has not been installed trendmicro agent
#### You can use this script to scan your whole network to find windows computers which are listening on port 445 but have not been installed trend micro agent (which listen on port tcp/64000, tcp/17774)
You must run scrip in linux server which:  
-install masscan  
-firewall permited to connect to 445,64000 tcp ports on your network.

**usage:** sudo ./find-non-av-installed-computers.sh "networkrange" "networkname"  
**e.g:** sudo ./find-non-av-installed-computers.sh "10.45.6.0/24 10.34.6.0/24" "branch1"  
