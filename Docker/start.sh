/usr/bin/supervisord  -n -c /etc/supervisor/conf.d/supervisord.conf &
while [[ "$(curl -s -o /dev/null -w ''%{http_code}'' http://localhost:80/api/v1/notifications/metadata)" != "200" ]]
do 
	clear
	echo ''
    echo -ne ' WAIT for Spinnaker to be ready .    '\\r
	sleep 2
	echo -ne ' WAIT for Spinnaker to be ready . .'\\r 
	sleep 2
	echo -ne ' WAIT for Spinnaker to be ready . . .'\\r
	sleep 2
done
echo '                                       '
echo 'Quick-Spin is ready to go!'
wait