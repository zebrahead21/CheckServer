#!/bin/sh


#Check if server is up
#Check if process is running

get_ok=200
server_ok=true
aux=1

process=$(ps -ef |grep 'apache2' | grep root | wc -l)
if [ $process -ge $aux ] 
then
	echo "Process running"
else
	echo "Process not running"
	server_ok=false
fi

listen=$(netstat -plnt | grep ':80' | wc -l)
if [ $listen -ge $aux ] 
then
	echo "Server listening on port 80"
else
        echo "Server not listening on port 80"
        server_ok=false
fi

http_response=$(curl -sSI http://localhost | head -n 1 | awk '{print $2}')
if [ $http_response -eq $get_ok ]
then
  	echo "Site working"
else
        echo "Site response: $http_response"
        server_ok=false
fi

if [ "$server_ok" != "true" ]
then
	python script.py
fi


 
